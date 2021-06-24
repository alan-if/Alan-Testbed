# Syntaxes Colour Schemes

This directory contains references to the colour palettes and schemes used for syntax highlighting in the [ALAN Docs] project.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [ALAN Palettes and Schemes](#alan-palettes-and-schemes)
    - [Default Theme](#default-theme)
    - [Library Theme](#library-theme)
    - [Tutorial Theme](#tutorial-theme)
    - [Test Theme](#test-theme)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`alan-tester.cifc`][alan-tester.cifc] — [ColorImpact 4] palette project file for our test theme.
- [`alan-tester.txt`][alan-tester.txt] — Colour specs for our test theme.
- [`palettes.cifc`][palettes.cifc] — [ColorImpact 4] palettes collection project file.
- [`swatches_b16-eighties.png`][swatches_b16-eighties.png] — [HLJS GitHub] palette swatches.
- [`swatches_b16-google-dark.png`][swatches_b16-google-dark.png] — [Base16 Eighties] palette swatches.
- [`swatches_github.png`][swatches_github.png] — [Base16 Google Dark] palette swatches.


# ALAN Palettes and Schemes

Although the different Asciidoctor backends employ different syntax highlighters, which vary in the details of the syntax constructs they capture, the base colour palettes employed by their themes are the same, as well as their usage in the theme colour scheme (i.e. how each palette entry is applied to syntax elements).

For the ALAN syntax, we provide three different colour themes, to distinguish different types of ALAN code snippet, when the context requires it:

|  theme   | role/class |         scheme        |       type      |
|----------|------------|-----------------------|-----------------|
| Default  | _none_     | tweaked [HLJS GitHub] | greyish neutral |
| Library  | `lib`      | [Base16 Eighties]     | dark theme      |
| Tutorial | `tutorial` | [Base16 Google Dark]  | light theme     |

## Default Theme

The **Default** theme is used for generic examples, not linked to any external file.
For its theme, we use a slightly adapted version of the [GitHub theme][HLJS GitHub] from highlight.js, which was based on an [old colour scheme used by GitHub] in the past; it's a greyish neutral theme, leaning more toward the light side.

![GitHub palette][swatches_github.png]

## Library Theme

The **Library** theme is used to identify code excerpts from libraries and third party extensions.
For its theme, we use the [Base16 Eighties] scheme by [Chris Kempson], a dark theme.

![Base16 Eighties palette][swatches_b16-eighties.png]

## Tutorial Theme

The **Tutorial** theme is used to identify code belonging to a tutorial source being developed.
For its theme, we use the [Base16 Google Dark] scheme by [Seth Wright], where we use the __base07__ white colour as background, in order to produce a very light theme.

![Base16 Google Dark palette][swatches_b16-google-dark.png]

This palette contains duplicate colours, with entries __base0C__, __base0D__ and __base0F__ sharing the same colour value (`#3971ED`).


## Test Theme

The **ALAN Tester** palette is used in a custom Rouge theme to visually test and inspect results of our ALAN IF lexer, and it's not used in production.

![ALAN Tester palette][swatches_alan-tester.png]

It's main goal is to highlight with a different colour each syntax element covered by the lexer, whereas in our production themes some elements are hidden from view by assigning them the default text colour, or the same colour as other elmeents.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[ALAN Docs]: https://github.com/alan-if/alan-docs "Visit the ALAN Docs repository on GitHub"

[highlight.js]: https://highlightjs.org "Visit highlight.js website"

[old colour scheme used by GitHub]: https://github.com/primer/github-syntax-light "View the Primer GitHub light syntax theme repository"

[ColorImpact 4]: https://www.tigercolor.com/ColorImpact.htm "Visit ColorImpact 4 homepage at Tiger Color website"

<!-- upstream schemes -->

[Base16 Eighties]: https://github.com/chriskempson/base16-default-schemes/blob/master/eighties.yaml "View upstream Base16 Eighties scheme source"
[Base16 Google Dark]: https://github.com/chriskempson/base16-unclaimed-schemes/blob/master/google-dark.yaml "View upstream Base16 Google Dark scheme source"
[HLJS GitHub]: https://github.com/highlightjs/highlight.js/blob/main/src/styles/github.css "View upstream GitHub theme at highlight.js"

<!-- project files -->

[alan-tester.txt]: ./alan-tester.txt "View colour specs"
[alan-tester.cifc]: ./alan-tester.cifc "ColorImpact 4 palettes files"
[palettes.cifc]: ./palettes.cifc "ColorImpact 4 palettes files"
[swatches_b16-eighties.png]: ./swatches_b16-eighties.png "Base 16 Eighties palette swatches"
[swatches_b16-google-dark.png]: ./swatches_b16-google-dark.png "Base 16 Google Dark palette swatches"
[swatches_github.png]: ./swatches_github.png "GitHub palette swatches"
[swatches_alan-tester.png]: ./swatches_alan-tester.png "ALAN Tester palette swatches"

<!-- people -->

[Chris Kempson]: https://github.com/chriskempson "View Chris Kempson's GitHub profile"
[Seth Wright]: http://sethawright.com "Visit Seth Wright's website"

<!-- EOF -->
