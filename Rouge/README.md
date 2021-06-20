# Rouge Tests

Testing how to employ custom [Rouge] lexers in [Asciidoctor] projects.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Objectives](#objectives)
- [Overview](#overview)
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

- [`alan3.rb`][alan3.rb] — custom Rouge lexer for Alan (WIP, developed elsewhere)
- [`custom-rouge-adapter.rb`][custom-rouge-adapter.rb] — tweaks the Rouge adapter for Asciidoctor that loads (requires) our `alan3.rb` lexer.

Tests:

- [`rougify-term.sh`][rougify-term.sh] — highlights `sample.alan` in the terminal, via CLI.
- [`asciidoctor-example.asciidoc`][asciidoctor-example.asciidoc] — Asciidoctor test document.
- [`asciidoctor-example.html`][asciidoctor-example.html] — converted HTML doc ([Live HTML Preview][ADoc Ex Live])
- [`asciidoctor-example.sh`][asciidoctor-example.sh] — converts `asciidoctor-example.asciidoc` to HTML using our `alan3.rb` lexer.


# Objectives

In order to integrate the Rouge highlighter with our ALAN Docs toolchain, we'll need to enforce our custom Rouge lexers on Asciidoctor, and provide custom themes for each language:

- [x] Bypass the native Asciidoctor Rouge API with a custom adapter, which instructs Rouge on where to find and load the custom lexer definitions.
- [ ] Define custom themes on a per language basis:
    + [ ] HTML Backend
        * [ ] Sass/CSS — for the HTML backend.
        * [ ] Bypass Rouge default theme — i.e. tell Asciidoctor to not include any auto-generated Rouge theme, and rely entirely on our custom CSS, if possible.
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

<!-- project files and folders -->

[/themes/]: ./themes/ "Navigate to folder"


[alan3.rb]: ./alan3.rb "View source file"

[asciidoctor-example.asciidoc]: ./asciidoctor-example.asciidoc
[asciidoctor-example.html]: ./asciidoctor-example.html
[asciidoctor-example.sh]: ./asciidoctor-example.sh
[ADoc Ex Live]: https://htmlpreview.github.io/?https://github.com/alan-if/Alan-Testbed/blob/master/Rouge/asciidoctor-example.html "Live HTML Preview of 'asciidoctor-example.htm'"

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
