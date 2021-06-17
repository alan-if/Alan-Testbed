# Testing UTF-8 Support

ALAN 3.0beta8 will introduce support for UTF-8 encoded source files and scripting, which will become the default encoding in Beta9; here we'll be testing this feature using developer snapshot [3.0beta8 build 2207].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [About UTF-8 Support](#about-utf-8-support)
- [Links](#links)

<!-- /MarkdownTOC -->

-----

# About UTF-8 Support

On June 4, 2021, [Thomas Nilefalk] announced on the [Alan IF discussions] group the long awaited UFT-8 support feature:

> The latest alpha/snapshot contains substantial improvements for those of you that work with non-ASCII languages as Alan now supports UTF-8 which is the predominant encoding on most systems of today.
> The advantage of this is that you (normally) don't have to do anything special to get Alan to correctly interpret your ñ, ä, ß and other characters.
> This has previously required special setup of editors and consoles to get to work right.
>
> You can read more about the function in the [alpha-level documentation] _Compiler Switches_ (`-encoding UTF-8`) and _Interpreter Switches_ (`-u`).
>
> For the upcoming beta8 you will explicitly have to tell the Alan compiler that the source files are in UTF-8, but for beta9 this will be the default.
> If your text file happens to be encoded with UTF-8 with a "BOM" (a special indicator in the file) Alan will already automatically respect that.
> (Some environments add this "marker", some don't).
>
> Also the interpreter accepts a UTF-8 option which of course controls command line input and output for the command line interpreters.
> But it also is useful for the GLK-based interpreters (WinArun, Gargoyle, ...) as logs and canned command input will have to be read with the correct encoding.
>
> So after beta9 (the beta release after the upcoming one), Alan authoring and running will be more natural for us who work in non-English lingua.

ALAN will still use single-character encoding internally, which means that adventures are still restricted to use characters within the ISO encoding range, but now source files and solution files can be fed to the ALAN compiler and interpreter encoded in UTF-8.

This is a huge improvements when it comes to handling source files in editors, IDEs and other tools, where UTF-8 is the current _de facto_ standard, and support for legacy encodings is often problematic.
From ALAN Beta9 onward, new users will no longer have to deal with all the quirks and complexities of ISO encodings.


# Links

- [alan-if/alan#12] — Add Support for UTF-8 Sources and I/O Stream
- [Alan IF discussions] » [UTF-8 support announcement]
- [_The ALAN Manual_ (Alpha Ed.)]:
    + [§A.2. _Compiler Switches_]
- [ALAN website] » [development snapshots] » [3.0beta8 build 2207]


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[ALAN website]: https://www.alanif.se "Visit ALAN website"

[alan-if/alan#12]: https://github.com/alan-if/alan/issues/12 "Issue #12 — Add Support for UTF-8 Sources and I/O Stream"
[Alan IF discussions]: https://groups.google.com/g/alan-if  "Alan IF discussions at Google Groups"
[UTF-8 support announcement]: https://groups.google.com/g/alan-if/c/frQugooK6jQ "Alan IF discussions: Development snapshots available again, with UTF-8 support"

<!-- Alan Man -->

[_The ALAN Manual_ (Alpha Ed.)]: https://alan-if.github.io/alan-docs/manual-alpha/manual.html
[§A.2. _Compiler Switches_]: https://alan-if.github.io/alan-docs/manual-alpha/manual.html#_compiler_switches

[alpha-level documentation]: https://alan-if.github.io/alan-docs/manual-alpha/manual.html#_how_to_use_the_system "The ALAN Manual (Alpha Ed.) » Appendix A: How to Use the System"

<!-- Alan SDKs -->

[development snapshots]: https://www.alanif.se/download-alan-v3/development-snapshots/development-snapshots "Development Snapshots page at www.alanif.se"
[3.0beta8 build 2207]: https://www.alanif.se/download-alan-v3/development-snapshots/development-snapshots/build2207 "ALAN SDK Development Snapshot 3.0beta8 build 2207"

<!-- people and organizations -->

[Thomas Nilefalk]: https://github.com/thoni56 "View Thomas Nilefalk's GitHub profile"

<!-- EOF -->
