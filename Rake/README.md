# Rake Tests

Experimenting with [Rake] (Ruby Make) in view of adopting it for all ALAN repositories.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [About](#about)
- [Reference Links](#reference-links)

<!-- /MarkdownTOC -->

# Folder Contents

- [`/simple1/`](./simple1/) — basic Rakefile: compile adventure and generate transcript from solution.

# About

Rake is Ruby's take on Make.
It's a powerful task management and build automation tool, far superior to Make, and well suited for our ALAN repositories — especially considering that most of them already depend on Ruby for Asciidoctor.

For an in-depth review of Rake's qualities, see Martin Fowler's article _[Using the Rake Build Language]_.

-----

# Reference Links

- [Rake website][Rake]
- [github.com/ruby/rake]
- [Wikipedia » Rake]

<!-- MarkdownTOC:excluded -->
## Ruby API

- [Ruby 3.0 API » FileUtils]
- [Ruby Std-lib 3.0.2 » Rake]
- [Ruby Std-lib 3.0.2 » Rake » FileUtils]

<!-- MarkdownTOC:excluded -->
## Rake Articles

- _[Using the Rake Build Language]_ — Martin Fowler.

<!-- MarkdownTOC:excluded -->
## Rake Tutorials

[Avdi Grimm]'s Rake Tutorials:

1. [Files and Rules][Avdi Files and Rules]
1. [File Lists][Avdi File Lists]
1. [Rules][Avdi Rules]
1. [Pathmap][Avdi Pathmap]
1. [File Operations][Avdi File Operations]
1. [Clean and Clobber][Avdi Clean and Clobber]
1. [MultiTask][Avdi MultiTask]

<!-- MarkdownTOC:excluded -->
## ALAN Repos

- [Alan Docs » Discussions » `rake` label] [AlanDocs Disc rake]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Rake]: https://ruby.github.io/rake/ "Rake (Ruby Make) website"
[Wikipedia » Rake]: https://en.wikipedia.org/wiki/Rake_(software) "Wikipedia page on Rake"
[github.com/ruby/rake]: https://github.com/ruby/rake "Rake repository at GitHub"

[Using the Rake Build Language]: https://martinfowler.com/articles/rake.html

<!-- Ruby API -->

[Ruby Std-lib 3.0.2 » Rake]:https://ruby-doc.org/stdlib-3.0.2/libdoc/rake/rdoc/
[Ruby Std-lib 3.0.2 » Rake » FileUtils]: https://ruby-doc.org/stdlib-3.0.2/libdoc/rake/rdoc/FileUtils.html
[Ruby 3.0 API » FileUtils]: https://rubyapi.org/3.0/o/fileutils

<!-- Avdi Tutorials -->

[Avdi Files and Rules]: https://avdi.codes/rake-part-1-basics/
[Avdi File Lists]: https://avdi.codes/rake-part-2-file-lists-2/
[Avdi Rules]: https://avdi.codes/rake-part-3-rules/
[Avdi Pathmap]: https://avdi.codes/rake-part-4-pathmap/
[Avdi File Operations]: https://avdi.codes/rake-part-5-file-operations/
[Avdi Clean and Clobber]: https://avdi.codes/rake-part-6-clean-and-clobber/
[Avdi MultiTask]: https://avdi.codes/rake-part-7-multitask/

<!-- ALAN Repos -->

[AlanDocs Disc rake]: https://github.com/alan-if/alan-docs/discussions?discussions_q=label%3A%22%3Ahammer%3A+Rake%22 "All Alan-Docs discussions labelled 'rake'"

<!-- people -->

[Avdi Grimm]: https://github.com/avdi "View Avdi Grimm's GitHub profile"


<!-- EOF -->
