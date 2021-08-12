# The ALAN IF Testbed

- https://github.com/alan-if/Alan-Testbed

A safe place to carry out your Alan-related experiments without nuking out of existence your PC and neighbourhood.

Created by [Tristano Ajmone], June 6, 2021; released under [Apache License 2.0].

-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Project Contents](#project-contents)
- [ALAN Files Extensions](#alan-files-extensions)
- [License](#license)
- [Useful Links](#useful-links)

<!-- /MarkdownTOC -->

-----

# Project Contents

- [`/Rake/`][/Rake/] — [Rake] (Ruby Make) tests and work.
- [`/syntax-hl/`][/syntax-hl/] — syntax highlighters tests:
    + [`/Highlight/`][/Highlight/]
    + [`/Rouge/`][/Rouge/]
    + [`/schemes/`][/schemes/]
- [`/utf8/`](./utf8/) — ALAN Beta8 UTF-8 support tests.


# ALAN Files Extensions

This project contains the following Alan-specific files extensions:

|   ext   |               description                |  type  |  status |
|---------|------------------------------------------|--------|---------|
| `.a3c`  | Compiled game.                           | binary | ignored |
| `.a3r`  | Compiled game resources (images/sounds). | binary | ignored |
| `.a3s`  | Commands script (solution file).         | text   | tracked |
| `.a3t`  | Game transcript.                         | text   | tracked |
| `.alan` | Alan source file.                        | text   | tracked |
| `.i`    | Alan source module.                      | text   | tracked |
| `.ifid` | Source adventure IFID file.              | text   | tracked |
| `.log`  | Compiler/ARun log file.                  | text   | ignored |
| `.sav`  | Saved game (used for testing).           | binary | ignored |


# License

- [`LICENSE`][LICENSE]

This project is Copyright © by the [Alan IF Development team], released under the terms of the [Apache License 2.0].

```
Copyright 2021 by the Alan Interactive Fiction Development team

    https://github.com/alan-if
    https://www.alanif.se

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this project except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

-------------------------------------------------------------------------------

# Useful Links

- [www.AlanIF.se][Alan] — the Alan website.
- [Alan IF Google Group] — for community help, announcements and discussions.
- [Alan sources on GitHub][Alan GitHub] — source code repository on GitHub.
- [Alan IF Development team] — GitHub profile and public projects.
- [Alan Docs] — GitHub repository for Alan documentation.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Apache License 2.0]: https://www.apache.org/licenses/LICENSE-2.0.html "Apache License 2.0 at www.apache.org"

<!-- ALAN -->

[Alan]: https://www.alanif.se/ "Visit the Alan website"
[Alan IF]: https://www.alanif.se/ "Visit the Alan website"
[Alan IF Google Group]: https://groups.google.com/g/alan-if/ "Visit the Alan IF discussions group on Google Groups"
[Alan GitHub]: https://github.com/alan-if/alan/ "Visit the Alan source repository on GitHub"
[Alan SDK]: https://www.alanif.se/download-alan-v3/development-kits "Go to the Alan SDK section of the Alan website"

[Artistic License 2.0]: https://opensource.org/licenses/Artistic-2.0

<!-- AlanIDE -->

[AlanIDE]: https://www.alanif.se/download-alan-v3/alanide "Go to the AlanIDE download page on Alan website"
[AlanIDE info page]: https://www.alanif.se/information/alanide/alanide-intro "View the AlanIDE information page on Alan website"
[Alan IDE Reference Guide]: https://github.com/alan-if/alan-docs/blob/master/ideguide/ideguide.pdf "Get the 'Alan IDE Reference Guide' (PDF format)"
[AlanIDE sources]: https://github.com/thoni56/alanide "Visit the AlanIDE source repository on GitHub"

<!-- Alan StdLib -->

[Alan Standard Library]: https://github.com/AnssiR66/AlanStdLib/ "Visit the official repository of the Alan Standard Library on GitHub"

<!-- misc Alan projects  -->

[Alan Bugs Testbed]: https://github.com/alan-if/alan-bugs-testbed "Visit the Alan Bugs Testbed project on GitHub"
[Alan Builder]: https://github.com/alan-if/Alan-Builder "Visit the Alan Builder project on GitHub"
[Alan Goodies]: https://github.com/alan-if/alan-goodies "Visit the Alan Goodies project on GitHub"
[Alan Italian]: https://github.com/tajmone/Alan3-Italian "Visit the Alan Italian project on GitHub"
[Alan Library v0.6.2]: https://github.com/alan-if/alan-goodies/tree/master/libs "View Alan Lib v0.6.2 at the 'Alan Goodies' project"
[Alan Repository Template]: https://github.com/alan-if/alan-repository-template "Visit the Alan Repository Template on GitHub"
[Alan StdLibLab]: https://github.com/tajmone/Alan-StdLibLab "Visit the Alan StdLibLab project on GitHub"
[Sublime Alan IF]: https://github.com/tajmone/sublime-alan-if "Visit the Sublime Alan IF project on GitHub"

<!-- Alan docs & tutorials -->

[Alan Docs]: https://github.com/alan-if/alan-docs "Visit the Alan Docs project on GitHub"
[The Alan Manual]: http://htmlpreview.github.io/?https://github.com/alan-if/alan-docs/blob/master/manual/manual.html "Live HTML preview of the Alan Manual"
[Alan Cookbook v2]: https://www.alanif.se/download-alan-v3/all-downloads/documentation/alan-cookbook-v2 "Go to the 'Alan Cookbook' download page on Alan website"

[The Alan Beginner's Guide]: http://htmlpreview.github.io/?https://github.com/alan-if/alan-docs/blob/master/alanguide/alanguide.html "Live HTML preview of the Alan Beginner's Guide"

[Samples & examples for Alan v3]: https://www.alanif.se/information/samples
[Alan by Examples]: https://github.com/alan-if/alan-by-examples "Visit the Alan by Examples project"

<!-- 3rd party tools & services -->

[Rake]: https://ruby.github.io/rake/ "Rake (Ruby Make) website"
[Sublime Text 4]: https://www.sublimetext.com "Visit Sublime Text website"
[Travis CI]: https://travis-ci.com/ "Visit Travis CI website"

<!-- project files and folders -->

[/Rake/]: ./Rake/ "Rake (Ruby Make) tests and work folder"

[/syntax-hl/]: ./syntax-hl/ "Syntax highlighters tests and work folder"
[/Highlight/]: ./syntax-hl/Highlight/ "Highlight syntax highlighter"
[/Rouge/]: ./syntax-hl/Rouge/ "Rouge (Ruby) syntax highlighter"
[/schemes/]: ./syntax-hl/schemes/ "Syntax highlighters themes"

[LICENSE]: ./LICENSE "View full text of the Apache License 2.0"

<!-- people and organizations -->

[Alan IF Development team]: https://github.com/alan-if "Visit the Alan Interactive Fiction Development team organization on GitHub"

[Anssi Räisänen]: https://github.com/AnssiR66 "View Anssi Räisänen's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"
[Thomas Nilefalk]: https://github.com/thoni56 "View Thomas Nilefalk's GitHub profile"

<!-- EOF -->
