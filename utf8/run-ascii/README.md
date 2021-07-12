# ARun ASCII Tests

Testing ARun behaviour with a source adventure and solution file containing only ASCII chars, using different `-u` options and/or solution encodings.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [About The Tests](#about-the-tests)
    - [ISO Solution](#iso-solution)
    - [UTF-8 BOM Solution, No Options](#utf-8-bom-solution-no-options)
    - [UTF-8 BOM Solution, With `-u` Option](#utf-8-bom-solution-with-u-option)

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
- [`output_utf8-bom.a3t`][output_utf8-bom.a3t]
- [`output_utf8-bom_-u.a3t`][output_utf8-bom_-u.a3t]


# About The Tests

The following tests are carried out after compiling the `../kitchen-ascii.alan` into this folder:

## ISO Solution

The `input_iso.a3s` solution file is passed to ARun, without encoding options, and the transcript is redirected to:

- [`output_iso.a3t`][output_iso.a3t]

It generates an ISO encoded transcript.


## UTF-8 BOM Solution, No Options

The `input_utf8-bom.a3s` solution file is passed to ARun, without encoding options, and the transcript is redirected to:

- [`output_utf8-bom.a3t`][output_utf8-bom.a3t]

It generates an UTF-8 transcript (no BOM), which works correctly but contains an inline BOM where the first command from the solution file is found (see [alan#32]).


## UTF-8 BOM Solution, With `-u` Option

The `input_utf8-bom.a3s` solution file is passed to ARun, with the `-u` optioon for UTF-8 encoding, and the transcript is redirected to:

- [`output_utf8-bom_-u.a3t`][output_utf8-bom_-u.a3t]

It generates an UTF-8 transcript (no BOM), which works correctly but contains an inline BOM where the first command from the solution file is found (see [alan#32]).


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- project files and folders -->

[test.sh]: ./test.sh

[input_iso.a3s]: ./input_iso.a3s
[input_utf8-bom.a3s]: ./input_utf8-bom.a3s


[output_iso.a3t]: ./output_iso.a3t
[output_utf8-bom.a3t]: ./output_utf8-bom.a3t
[output_utf8-bom_-u.a3t]: ./output_utf8-bom_-u.a3t

<!-- Issues -->

[alan#32]: https://github.com/alan-if/alan/issues/32 "Issue #32 at alan-if/alan — BUG: ARun w/ UTF-8 BOM Solution Files"

<!-- EOF -->
