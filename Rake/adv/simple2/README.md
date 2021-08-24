# Simple Rakefile #2

A simple example of using [Rake rules] to compile an adventure with additional source modules, and procedurally add file tasks for generating transcripts from multiple solution files.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Usage](#usage)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`Rakefile`](Rakefile]) — Rake example.

Source files:

- [`elevator.alan`](elevator.alan) — source adventure with imported modules:
    + [`nowhere.i`](nowhere.i)
    + [`verbs.i`](verbs.i)
- [`generic_test.a3s`](generic_test.a3s) — solution file.
- [`walkthrough.a3s`](walkthrough.a3s) — solution file.

Generated target files:

- `elevator.a3c` — compiled storyfile.
- [`generic_test.a3t`](generic_test.a3t) — generated transcript.
- [`walkthrough.a3t`](walkthrough.a3t) — generated transcript.

Generated extra files:

- `elevator.ifid` — created by compiler.

# Usage

To run the build:

    $ rake

To forcefully re-build:

    $ rake -B

-------------------------------------------------------------------------------

To view tasks dependencies:

    $ rake -P

-------------------------------------------------------------------------------

To delete all generated files:

    $ rake clobber

To delete only generated `.ifid` file:

    $ rake clean


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Rake rules]: https://ruby.github.io/rake/doc/rakefile_rdoc.html#label-Rules

<!-- EOF -->
