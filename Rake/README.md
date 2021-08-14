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

Rake was created by [Jim Weirich] (1965–2014).

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
- _[The coolness that is Rake]_ — Joe White.
- _[Building with Rake]_ — slideshow by [Jim Weirich] (2003).


<!-- MarkdownTOC:excluded -->
## Rake Tutorials

[Jim Weirich]'s [Rake tutorials (2005)] (CC BY-NC 1.0) from [onestepback.org] via Wayback Machine:

- _[Getting Started]_
- _[Handling Common Actions]_
- _[Another C Example]_


[Avdi Grimm]'s Rake Tutorials:

1. [Files and Rules][Avdi Files and Rules]
1. [File Lists][Avdi File Lists]
1. [Rules][Avdi Rules]
1. [Pathmap][Avdi Pathmap]
1. [File Operations][Avdi File Operations]
1. [Clean and Clobber][Avdi Clean and Clobber]
1. [MultiTask][Avdi MultiTask]

<!-- MarkdownTOC:excluded -->
## Rake Video Tutorials

- _[Basic Rake]_ (31 min) — by [Jim Weirich].
- _[Goruco 2012 Power Rake]_ (46 min) — by [Jim Weirich].

<!-- MarkdownTOC:excluded -->
## Rake Books

- _[Rake Task Management Essentials]_ — by Andrey Koleshko, 2014.

<!-- MarkdownTOC:excluded -->
## ALAN Repos

- [Alan Docs » Discussions » `rake` label] [AlanDocs Disc rake]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Rake]: https://ruby.github.io/rake/ "Rake (Ruby Make) website"
[Wikipedia » Rake]: https://en.wikipedia.org/wiki/Rake_(software) "Wikipedia page on Rake"
[github.com/ruby/rake]: https://github.com/ruby/rake "Rake repository at GitHub"

[onestepback.org]: https://onestepback.org

<!-- Ruby API -->

[Ruby Std-lib 3.0.2 » Rake]:https://ruby-doc.org/stdlib-3.0.2/libdoc/rake/rdoc/
[Ruby Std-lib 3.0.2 » Rake » FileUtils]: https://ruby-doc.org/stdlib-3.0.2/libdoc/rake/rdoc/FileUtils.html
[Ruby 3.0 API » FileUtils]: https://rubyapi.org/3.0/o/fileutils

<!-- Rake articles -->

[Using the Rake Build Language]: https://martinfowler.com/articles/rake.html
[The coolness that is Rake]: https://blog.excastle.com/2006/09/05/the-coolness-that-is-rake/
[Building with Rake]: https://web.archive.org/web/20140220214827/http://www.onestepback.org/articles/buildingwithrake/index.html

<!-- Jim Weirich Tutorials -->

[Rake tutorials (2005)]: https://web.archive.org/web/20140220214314/https://www.onestepback.org/index.cgi/Tech/Rake/Tutorial
[Getting Started]: https://web.archive.org/web/20140220202215/http://onestepback.org/index.cgi/Tech/Rake/Tutorial/RakeTutorialIntroduction.rdoc
[Handling Common Actions]: https://web.archive.org/web/20140220202125/http://onestepback.org/index.cgi/Tech/Rake/Tutorial/RakeTutorialRules.red
[Another C Example]: https://web.archive.org/web/20140220202128/http://onestepback.org/index.cgi/Tech/Rake/Tutorial/RakeTutorialAnotherCExample.red

<!-- Avdi Tutorials -->

[Avdi Files and Rules]: https://avdi.codes/rake-part-1-basics/
[Avdi File Lists]: https://avdi.codes/rake-part-2-file-lists-2/
[Avdi Rules]: https://avdi.codes/rake-part-3-rules/
[Avdi Pathmap]: https://avdi.codes/rake-part-4-pathmap/
[Avdi File Operations]: https://avdi.codes/rake-part-5-file-operations/
[Avdi Clean and Clobber]: https://avdi.codes/rake-part-6-clean-and-clobber/
[Avdi MultiTask]: https://avdi.codes/rake-part-7-multitask/

<!-- Video Tutorials -->

[Basic Rake]: https://amara.org/en/videos/wg3cI6Nxjuxg/info/basic-rake-by-jim-weirich/
[Goruco 2012 Power Rake]: https://amara.org/en/videos/GxlygXn6h8SB/info/goruco-2012-power-rake-by-jim-weirich/

<!-- Rake Books -->

[Rake Task Management Essentials]: https://www.packtpub.com/product/rake-task-management-essentials/9781783280773

<!-- ALAN Repos -->

[AlanDocs Disc rake]: https://github.com/alan-if/alan-docs/discussions?discussions_q=label%3A%22%3Ahammer%3A+Rake%22 "All Alan-Docs discussions labelled 'rake'"

<!-- people -->

[Avdi Grimm]: https://github.com/avdi "View Avdi Grimm's GitHub profile"
[Jim Weirich]: https://en.wikipedia.org/wiki/Jim_Weirich "Wikipedia » Jim Weirich"

<!-- EOF -->
