# Simple Rakefile #1

A very simple example of using Rake to compile an adventure and generate a transcript from a solution file.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Usage](#usage)
- [Credits](#credits)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`Rakefile`](Rakefile]) — Rake example.

Source files:

- [`elevator.alan`](elevator.alan) — source adventure.
- [`elevator.a3s`](elevator.a3s) — solution file.

Generated target files:

- `elevator.a3c` — compiled storyfile.
- [`elevator.a3t`](elevator.a3t) — generated transcript.

Generated extra files:

- `elevator.ifid` — created by compiler.

# Usage

To run the build:

    $ rake

or even:

    $ rake elevator.a3t

which will only rebuild target files which are absent or which depend on other files that were modified, deleted or absent.
The dependency tree is:

- `elevator.a3t` depends on:
    + `elevator.a3s`.
    + `elevator.a3c` depends on:
        * `elevator.alan`.

-------------------------------------------------------------------------------

To just compile `elevator.alan`:

    $ rake elevator.a3c

-------------------------------------------------------------------------------

To delete all generated files:

    $ rake clobber

To delete only generated `.ifid` file:

    $ rake clean

-------------------------------------------------------------------------------

To force the build use switch `-B`/`--build-all`:

    $ rake -B

-------------------------------------------------------------------------------

To see tasks info use `-T`/`--tasks`:

    $ rake -T


# Credits

The OS detection trick used in the `Rakefile` is based on the [StackOverflow solution by selenium, reposted by Thomas Enebo]:

```ruby
require 'rbconfig'

def os
  @os ||= (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
    end
  )
end
```

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[StackOverflow solution by selenium, reposted by Thomas Enebo]: https://stackoverflow.com/a/13586108 "StackOverflow: Detecting Operating Systems in Ruby"

<!-- EOF -->
