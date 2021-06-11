# Rouge Tests

Testing how to employ custom [Rouge] lexers in [Asciidoctor] projects.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Objectives](#objectives)
- [Challenges](#challenges)
- [Info](#info)
    - [Custom Lexers with Rougify via CLI](#custom-lexers-with-rougify-via-cli)
    - [Custom Lexers with Asciidoctor](#custom-lexers-with-asciidoctor)

<!-- /MarkdownTOC -->

-----

# Directory Contents


- [`alan3.rb`][alan3.rb] — custom Rouge lexer for Alan (WIP, developed elsewhere)
- [`sample.alan`][sample.alan] — sample Alan source
- [`rougify-term.sh`][rougify-term.sh] — highlights `sample.alan` in the terminal, via CLI.


# Objectives

Rouge is a Ruby syntax highlighter which is natively supported by Asciidoctor in various backends.
Our goal would be to employ Rouge for the HTML backend, instead of [Highlight], due to lack of callouts support with the latter (see [alan-docs#107] and [alan-docs#36]).

We're also planning to migrate from [asciidoctor-fopub] to [asciidoctor-pdf] for the PDF backend, once the latter is more mature for our needs.
When this will happen, Rouge could be used for syntax highlighting PDF documents too, which lessens our dependencies and maintenance work considerably, beside ensuring stylistic consistency across the various documents formats.

We'd also like to be able to use our own Rouge lexers (i.e. syntax definitions), tailored to our needs, instead of having to submit them to the upstream [Rouge repository] in order for Asciidoctor to be able to use them via the Rouge gem.

Furthermore, we'd like to bypass Asciidoctor's inclusion of Rouge themes in the generated HTML, and use our custom CSS stylesheets for colouring code blocks, in order to provide different themes for each language, as well as alternative themes for Alan, based on the block's `role`.

# Challenges

In order to use custom Rouge lexers with Asciidoctor we'll need to either:

1. Bypass Asciidoctor's native Rouge module with a custom extension, which could then instruct Rouge on where to find the custom lexer definitions.
2. Invoke Asciidoctor via its Ruby API, which offers a higher degree of control in terms of options when interacting with the Rouge library.

In this directory we'll be testing both approaches, to see which one works better for us, and so that we may weigh the pros and cons of both.


# Info

## Custom Lexers with Rougify via CLI

Assuming our lexer is called `alan3.rb`, to highlight the `sample.alan` file from the command line we only need to use the `--require`/`-r` option:

To highlight an Alan source file using a custom Rouge lexer from the command line, we only need to use the `--require`/`-r` option:

```bash
$ rougify sample.alan --require ./alan3.rb
```

## Custom Lexers with Asciidoctor

As for Asciidoctor, there doesn't seem to be a way to enforce the `--require` option on Rouge.
My best guess right now is we might need to write a custom Rouge extension and override Asciidoctor's native API for Rouge:

- [`lib/asciidoctor/syntax_highlighter/rouge.rb`][rouge.rb]

Or invoke Asciidoctor via Ruby, passing extra setting to the Rouge library.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Rouge]: http://rouge.jneen.net "Rouge website"
[Rouge repository]: https://github.com/rouge-ruby/rouge "Rouge repository on GitHub"

<!-- Asciidoctor -->

[Asciidoctor]: https://asciidoctor.org "Asciidoctor website"

[rouge.rb]: https://github.com/asciidoctor/asciidoctor/blob/master/lib/asciidoctor/syntax_highlighter/rouge.rb

<!-- 3rd Party tools -->

[asciidoctor-fopub]: https://github.com/asciidoctor/asciidoctor-fopub
[asciidoctor-pdf]: https://github.com/asciidoctor/asciidoctor-pdf
[Highlight]: http://www.andre-simon.de "Highlight website"

<!-- project files and folders -->

[alan3.rb]: ./alan3.rb "View source file"
[rougify-term.sh]: ./rougify-term.sh "View source file"
[sample.alan]: ./sample.alan "View source file"

<!-- Issues -->

[alan-docs#107]: https://github.com/alan-if/alan-docs/issues/107
[alan-docs#36]: https://github.com/alan-if/alan-docs/issues/36

<!-- EOF -->
