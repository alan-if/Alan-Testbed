# Rouge Tests

Testing how to employ custom [Rouge] lexers in [Asciidoctor] projects.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Objectives](#objectives)
- [Overview](#overview)
    - [The ALAN Lexer](#the-alan-lexer)
- [Tech Info](#tech-info)
    - [Custom Lexers with Rougify via CLI](#custom-lexers-with-rougify-via-cli)
    - [Custom Lexers via Rouge API](#custom-lexers-via-rouge-api)
    - [Custom Lexers with Asciidoctor](#custom-lexers-with-asciidoctor)
- [Credits](#credits)
- [Links](#links)
    - [Rouge](#rouge)
    - [Asciidoctor](#asciidoctor)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`/themes/`][/themes/] — themes references and work.
- [`sample.alan`][sample.alan] — sample Alan source (UTF-8 + BOM).

Custom Ruby scripts, lexers and libraries:

- [`alan3.rb`][alan3.rb] — custom Rouge lexer for Alan (WIP, developed here)
- [`custom-rouge-adapter.rb`][custom-rouge-adapter.rb] — tweaks the Rouge adapter for Asciidoctor that loads (requires) our `alan3.rb` lexer.

Tests:

- [`rougify-term.sh`][rougify-term.sh] — highlights `sample.alan` in the terminal, via CLI.

Sample documents:

- [`asciidoctor-example.asciidoc`][asciidoctor-example.asciidoc] — Asciidoctor example document.
- [`asciidoctor-example.html`][asciidoctor-example.html] — converted HTML doc ([Live HTML Preview][ADoc Ex Live])
- [`alan-syntax.asciidoc`][alan-syntax.asciidoc] — Asciidoctor test document for the ALAN lexer.
- [`alan-syntax.html`][alan-syntax.html] — converted HTML doc ([Live HTML Preview][ADoc Synt Live])
- [`build.sh`][build.sh] — converts all documents to HTML using our custom `alan3.rb` lexer and assets.


# Objectives

In order to integrate the Rouge highlighter with our ALAN Docs toolchain, we'll need to enforce our custom Rouge lexers on Asciidoctor, and provide custom themes for each language:

- [x] Bypass the native Asciidoctor Rouge API with a custom adapter, which instructs Rouge on where to find and load the custom lexer definitions.
- [ ] Define custom themes on a per language basis:
    + [ ] HTML Backend
        * [ ] Sass/CSS — for the HTML backend.
        * A native Rouge theme can still be specified via the `:rouge-style:` attribute (in doc header or via CLI opts) which will be converted to CSS as part of the default Asciidoctor CSS, this theme will be used as a fallback theme for code snippets in languages not covered by our custom CSS.
    + [ ] PDF Backend
        * [ ] Asciidoctor-pdf? when we'll switch from the DocBook/[asciidoctor-fopub] toolchain to [asciidoctor-pdf] we'll need to find a way to customize syntax themes.
- [ ] Invoke Asciidoctor via its Ruby API, which offers a higher degree of control in terms of options when interacting with the Rouge library, replacing Bash scripts with a Rake build system in our toolchain.

In this directory we'll be testing various approaches and solutions, to see which one works better for us, and so that we may weigh the pros and cons of each.


# Overview

Rouge is a Ruby syntax highlighter which is natively supported by Asciidoctor in various backends.
Our goal would be to employ Rouge for the HTML backend, instead of [Highlight], due to lack of callouts support with the latter (see [alan-docs#107] and [alan-docs#36]).

We're also planning to migrate from [asciidoctor-fopub] to [asciidoctor-pdf] for the PDF backend, once the latter is more mature for our needs (v2.0).
When this will happen, Rouge could be used for syntax highlighting PDF documents too, which lessens our dependencies and maintenance work considerably, beside ensuring stylistic consistency across the various documents formats.

We'd also like to be able to use our own Rouge lexers (i.e. syntax definitions), tailored to our needs, instead of having to submit them to the upstream [Rouge repository] in order for Asciidoctor to be able to use them via the Rouge gem.
E.g. we might need some in-house custom lexers for BNF, ALAN transcripts, etc., none of which is likely to qualify for integration in the official Rouge gem.

Furthermore, we'd like to bypass Asciidoctor's inclusion of Rouge themes in the generated HTML, and use our custom CSS stylesheets for colouring code blocks, in order to provide different themes for each language, as well as alternative themes for Alan, based on the block's `role`.


## The ALAN Lexer

Initially I started to work on the ALAN lexer ([`alan3.rb`][alan3.rb]) elsewhere, in my own fork of the [Rouge repository].
I've now started to develop the syntax here, because the current test toolchain found in this folder is simpler to use, and I can check the result using a custom theme ([`themes/alan-b16-eighties.rb`][alan-b16-eighties.rb]), which also simplifies tests since it colours some token classes not covered by Rouge's default themes, but required for ALAN.

The lexer filename (`alan3.rb`) and its associated syntax name (`alan3`) and aliases (`alan-if` and `alan`) are all temporary and might change in the final version.
If we're going to submit the lexer to the Rouge gem repository, we'll have to drop the `alan` alias and adopt `alan-if` as the syntax name instead, to avoid clashes with the [Alan programming language] developed by [Alan Technologies, Inc]  (see [alantech/alan#548]).

The problem is that currently all the documents in the __[ALAN Docs]__ and __[ALAN StdLib]__ projects (and others) are using `alan` as the source syntax name, so we'd have to change all its occurrences in the Asciidoctor sources, and also change the syntax name in the other highlighters too (e.g. the one used for the __[asciidoctor-fopub]__ PDF backend, which we'll be still using even after switching to Rouge, at least until we drop it in favour of the __[asciidoctor-pdf]__ backend).

We can always keep `alan3` as an alias, in case in the future we implement a lexer for ALAN 2.

As for the lexer features, I'm planning to use the full power of Rouge and Ruby to create a semantically detailed lexer, which will match tokens as accurately as possible.

For our use in the ALAN Docs project, we'll probably end up hiding all these semantic details by assigning the same colour to related tokens, in order to keep the syntax appearance simpler for the reader.


# Tech Info

Some info on the nitty gritty technicalities surrounding Rouge, the Asciidoctor API and their usage.


## Custom Lexers with Rougify via CLI

- [`rougify-term.sh`][rougify-term.sh] — highlights `sample.alan` in the terminal, via CLI, using our custom lexer.

Assuming our lexer is called `alan3.rb`, to highlight the `sample.alan` file from the command line we only need to use the `--require`/`-r` option:

To highlight an Alan source file using a custom Rouge lexer from the command line, we only need to use the `--require`/`-r` option:

```bash
$ rougify sample.alan --require ./alan3.rb
```

From rougify help:

```
$ rougify help highlight
usage: rougify highlight <filename> [options...]
       rougify highlight [options...]

[...]

--require|-r <filename>     require a filename or library before
                            highlighting
```


## Custom Lexers via Rouge API

I'm still not entirely sure how to instruct the Rouge API to require a custom lexer, but here's how the command line parameter `--require` is being handled by [`lib/rouge/cli.rb`][cli.rb] (L235):

```ruby
          when '-r', '--require'
            opts[:requires] << argv.shift
```

## Custom Lexers with Asciidoctor

- [asciidoctor#4080]
- [Asciidoctor Documentation] » [Custom Syntax Highlighter Adapter]

Thanks to [Dan Allen]  (@mojavelinux) for helping us out with the solution on how to make Rouge require a custom lexer.

- Create the file `custom-rouge-adapter.rb`:
    ```ruby
    require 'rouge'
    require './alan3.rb'

    class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
      register_for 'rouge'
    end
    ```
- Invoke Asciidoctor with `-r ./custom-rouge-adapter.rb`.

An alternative code for `custom-rouge-adapter.rb`, defers loading Rouge until the `load_library` method is called:

```ruby
class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  def load_library
    require 'rouge'
    require './alan3.rb'
    :loaded
  end
end
```

They both produce equal results for our scope.


# Credits

We'd like to thank [Dan Allen]  (@mojavelinux) from the [Asciidoctor Project] for his having helped us out with the solution on how to make Rouge require a custom lexer:

- [asciidoctor#4080]

-------------------------------------------------------------------------------

# Links

## Rouge

- [Rouge website][Rouge]
- [Rouge repository]
- [Rouge Wiki]
- [Rouge documentation]
- [Redcarpet]

## Asciidoctor

- [Asciidoctor website][Asciidoctor]
- [Asciidoctor repository]:
    + [`rouge.rb`][rouge.rb] — Asciidoctor's native API for Rouge.
    + [asciidoctor#4080] — Rouge Highlighter: Add 'rouge-require' Option for Custom Lexers and Themes
- [Asciidoctor Documentation]:
    + [Syntax Highlighting][AsciiDr Syntax Highlighting]:
        * [Rouge][AsciiDr Rouge]
        * [Custom Syntax Highlighter Adapter]


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[ALAN Docs]: https://github.com/alan-if/alan-docs "Visit the ALAN Docs repository on GitHub"
[ALAN StdLib]: https://github.com/AnssiR66/AlanStdLib "Visit the ALAN Standard Library repository on GitHub"

<!-- Rouge -->

[Rouge]: http://rouge.jneen.net "Rouge website"
[Rouge repository]: https://github.com/rouge-ruby/rouge "Rouge repository on GitHub"
[Rouge documentation]: https://rouge-ruby.github.io/docs/ "Rouge online documentation"
[Rouge Wiki]: https://github.com/rouge-ruby/rouge/wiki "Rouge Wiki on GitHub"

[List of tokens]: https://github.com/rouge-ruby/rouge/wiki/List-of-tokens "Rouge Wiki » List of tokens"

[cli.rb]: https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/cli.rb#L235 "View source file at Rouge repository"

<!-- Asciidoctor -->

[Asciidoctor]: https://asciidoctor.org "Asciidoctor website"

[Asciidoctor repository]: https://github.com/asciidoctor/asciidoctor "Asciidoctor repository on GitHub"
[rouge.rb]: https://github.com/asciidoctor/asciidoctor/blob/master/lib/asciidoctor/syntax_highlighter/rouge.rb

[Asciidoctor Documentation]: https://docs.asciidoctor.org/asciidoctor/latest/
[AsciiDr Syntax Highlighting]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/
[AsciiDr Rouge]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/rouge/
[Custom Syntax Highlighter Adapter]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/custom/

<!-- 3rd Party tools -->

[asciidoctor-fopub]: https://github.com/asciidoctor/asciidoctor-fopub "asciidoctor-fopub repository on GitHub"
[asciidoctor-pdf]: https://github.com/asciidoctor/asciidoctor-pdf "asciidoctor-pdf repository on GitHub"
[Highlight]: http://www.andre-simon.de "Highlight website"
[Redcarpet]: https://github.com/vmg/redcarpet "Redcarpet repository on GitHub"

<!-- Alan Tech Inc. -->

[Alan programming language]: https://alan-lang.org "Alan programming language website"
[alantech/alan#548]: https://github.com/alantech/alan/issues/548 "Issue #548 — Name Clashes with ALAN IF Language"
[Alan Technologies, Inc]: https://github.com/alantech "View Alan Technologies, Inc's GitHub profile"

<!-- project files and folders -->

[/themes/]: ./themes/ "Navigate to folder"
[alan-b16-eighties.rb]: ./themes/alan-b16-eighties.rb

[alan3.rb]: ./alan3.rb "View source file"

[build.sh]: ./build.sh

[asciidoctor-example.asciidoc]: ./asciidoctor-example.asciidoc
[asciidoctor-example.html]: ./asciidoctor-example.html
[ADoc Ex Live]: https://htmlpreview.github.io/?https://github.com/alan-if/Alan-Testbed/blob/master/syntax-hl/Rouge/asciidoctor-example.html "Live HTML Preview of 'asciidoctor-example.htm'"

[alan-syntax.asciidoc]: ./alan-syntax.asciidoc
[alan-syntax.html]: ./alan-syntax.html
[ADoc Synt Live]: https://htmlpreview.github.io/?https://github.com/alan-if/Alan-Testbed/blob/master/syntax-hl/Rouge/alan-syntax.html "Live HTML Preview of 'alan-syntax.htm'"

[custom-rouge-adapter.rb]: ./custom-rouge-adapter.rb
[rougify-term.sh]: ./rougify-term.sh "View source file"
[sample.alan]: ./sample.alan "View source file"

<!-- Issues -->

[alan-docs#107]: https://github.com/alan-if/alan-docs/issues/107
[alan-docs#36]: https://github.com/alan-if/alan-docs/issues/36
[asciidoctor#4080]: https://github.com/asciidoctor/asciidoctor/issues/4080 "Rouge Highlighter: Add 'rouge-require' Option for Custom Lexers and Themes"

<!-- people and orgs -->

[Dan Allen]: https://github.com/mojavelinux "View Dan Allen's GitHub profile"

[Asciidoctor Project]: https://github.com/asciidoctor "View the Asciidoctor Project organization profile on GitHub"

<!-- EOF -->
