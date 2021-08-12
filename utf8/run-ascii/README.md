# ARun ASCII Tests

Testing ARun behaviour with a source adventure and solution file containing only ASCII chars, using different `-u` options and/or solution encodings.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [About The Tests](#about-the-tests)
    - [ISO Solution](#iso-solution)
    - [ISO Solution, No `-u` Option](#iso-solution-no-u-option)
    - [UTF-8 BOM Solution, No `-u` Option](#utf-8-bom-solution-no-u-option)
    - [UTF-8 BOM Solution, With `-u` Option](#utf-8-bom-solution-with-u-option)
- [References](#references)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`test.sh`][test.sh] — run all tests.

Solution files (ASCII chars only):

- [`input_iso.a3s`][input_iso.a3s] — encoded as ISO-8859-1.
- [`input_utf8-bom.a3s`][input_utf8-bom.a3s] — encoded as UTF-8 + BOM.

> **NOTE** — since these files contain only ASCII chars, the difference between them is just the presence/absence of a BOM.

Generated transcripts:

- [`output_iso.a3t`][output_iso.a3t]
- [`output_iso_-u.a3t`][output_iso_-u.a3t]
- [`output_utf8-bom.a3t`][output_utf8-bom.a3t]
- [`output_utf8-bom_-u.a3t`][output_utf8-bom_-u.a3t]


# About The Tests

The following tests are carried out after compiling the `../kitchen-ascii.alan` into this folder.

|      .a3s file       | .a3s encoding | ARun |        .a3t file         | .a3t encoding |
|----------------------|---------------|------|--------------------------|---------------|
| `input_iso.a3s`      | ISO-8859-1    |      | `output_iso.a3t`         | ISO-8859-1    |
| `input_iso.a3s`      | ISO-8859-1    | `-u` | `output_iso_-u.a3t`      | UTF-8 BOM     |
| `input_utf8-bom.a3s` | UTF-8 BOM     |      | `output_utf8-bom.a3t`    | ISO-8859-1    |
| `input_utf8-bom.a3s` | UTF-8 BOM     | `-u` | `output_utf8-bom_-u.a3t` | UTF-8 BOM     |

These tests proof that ARun:

- Handles well BOM autodetection in solution files.
- Will create ISO-8859-1 encoded transcripts, unless the `-u` switch is used.
- The `-u` switch will force transcripts to be UTF-8 with BOM.


> **NOTE** — ARun is invoked with the switches (see [§A.5]) `-r` (don't timestamp, page break, randomize…) and `-l` (log transcript to `<storyfile-name>.a3t` file) instead of redirecting STDOUT to an `.a3t` file because redirection would result in the BOM from the solution file being injected into the middle of the transcript, where the first command is issued (see [alan#32]).
>
> This means that the generated transcript has to be manually renamed whenever we need it to have a different base-name than the storyfile.

## ISO Solution

The `input_iso.a3s` solution file is passed to ARun, without encoding options, and the generated transcript is renamed to:

- [`output_iso.a3t`][output_iso.a3t]

It generates an ISO encoded transcript.


## ISO Solution, No `-u` Option

The `input_iso.a3s` solution file is passed to ARun, with the `-u` option for UTF-8 encoding, and the generated transcript is renamed to:

- [`output_iso_-u.a3t`][output_iso_-u.a3t]

It generates an UTF-8 transcript (with BOM).


## UTF-8 BOM Solution, No `-u` Option

The `input_utf8-bom.a3s` solution file is passed to ARun, without encoding options, and the generated transcript is renamed to:

- [`output_utf8-bom.a3t`][output_utf8-bom.a3t]

It generates an ISO-8859-1 transcript.


## UTF-8 BOM Solution, With `-u` Option

The `input_utf8-bom.a3s` solution file is passed to ARun, with the `-u` option for UTF-8 encoding, and the generated transcript is renamed to:

- [`output_utf8-bom_-u.a3t`][output_utf8-bom_-u.a3t]

It generates an UTF-8 transcript (with BOM).


-------------------------------------------------------------------------------

# References

- [alan-if/alan#32][alan#32] — BUG: ARun w/ UTF-8 BOM Solution Files
- [_The ALAN Manual_ (Alpha Ed.)]:
    + [§A.5. _Interpreter Switches_][§A.5]


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- project files and folders -->

[test.sh]: ./test.sh

[input_iso.a3s]: ./input_iso.a3s
[input_utf8-bom.a3s]: ./input_utf8-bom.a3s


[output_iso.a3t]: ./output_iso.a3t
[output_iso_-u.a3t]: ./output_iso_-u.a3t
[output_utf8-bom.a3t]: ./output_utf8-bom.a3t
[output_utf8-bom_-u.a3t]: ./output_utf8-bom_-u.a3t

<!-- ALAN Manual -->


[_The ALAN Manual_ (Alpha Ed.)]: https://alan-if.github.io/alan-docs/manual-alpha/manual.html

[§A.5]: https://alan-if.github.io/alan-docs/manual-alpha/manual.html#_interpreter_switches "The ALAN Manual (Alpha Ed) » §A.5. Interpreter Switches"

<!-- Issues -->

[alan#32]: https://github.com/alan-if/alan/issues/32 "Issue #32 at alan-if/alan — BUG: ARun w/ UTF-8 BOM Solution Files"

<!-- EOF -->
