# Highlight Tests

Test and update Highlight syntaxes and assets for the ALAN Docs Asciidoctor toolchain.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [About](#about)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`/hl/`][/hl/] — Highlight assets:
    + [`/adoc/`][/adoc/] — Asciidoctor assets:
        * [`/highlight-treeprocessor_mod.rb`][rb] — extension for Highlight integration.
    + [`/haml/`][/haml/] — customized Haml HTML5 templates.
    + [`/langDefs/`][/langDefs/] — customized Highlight syntax definitions:
        * [`alan.lang`][alan.lang] — WIP update to ALAN 3.0beta8.
- [`/sass/`][/sass/] — Sass/SCSS sources for custom CSS themes and styles.
- [`build.bat`][build.bat] — batch build script for our tests.
- [`build.sh`][build.sh] — Bash build script for our tests.
- [`sample.asciidoc`][sample.asciidoc] — test document.
- [`sample.alan`][sample.alan] — sample ALAN code included in test document.
- [`sample.html`][sample.html] — generated HTML doc.
- [`docinfo.html`][docinfo.html] — [docinfo header file] with custom CSS themes.


# About

This directory is still pretty much WIP, and its resources not yet working as expected.

Our current goals are:

- [ ] Update the [`alan.lang`][alan.lang] syntax definition:
    + [ ] Support the new block comments added in Beta8 (the block comments pattern is currently failing to close, need to fix it via Lua hook function).
    + [ ] Remove the ISO-8559-1/UTF-8 hacks in the syntax (to handle some chars that might be encoded differently) and make the syntax target UTF-8 only.
- [ ] Update the Sass sources to cover block comments styles.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[docinfo header file]: https://docs.asciidoctor.org/asciidoctor/latest/docinfo/ "Asciidoctor Documentation » Docinfo Files"

<!-- project files and folders -->

[/hl/]: ./hl/ "Navigate to folder"
[/adoc/]: ./hl/adoc/ "Asciidoctor assets for Highlight toolchain"
[/haml/]: ./hl/haml/ "Haml HTML templates"
[/langDefs/]: ./hl/langDefs/ "Highlight custom syntaxes"
[/sass/]: ./hl/sass/ "Sass/SCSS sources for custom CSS stylesheet"

[rb]: ./hl/adoc/highlight-treeprocessor_mod.rb "Custom Asciidoctor extension for Highlight"
[alan.lang]: ./hl/langDefs/alan.lang "View ALAN syntax definition for Highlight"


[build.bat]: ./build.bat
[build.sh]: ./build.sh
[docinfo.html]: ./docinfo.html
[sample.alan]: ./sample.alan
[sample.asciidoc]: ./sample.asciidoc
[sample.html]: ./sample.html

<!-- EOF -->
