# Rouge Themes

Looking into Rouge themes and how to customize them in Asciidoctor HTML via custom Sass stylesheets.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Asciidoctor HTML Tags](#asciidoctor-html-tags)
- [License and Credits](#license-and-credits)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`alan-b16-eighties.rb`][alan-b16-eighties.rb] — custom Base16 Eighties theme for ALAN (WIP).
- [`alan-tester.rb`][alan-tester.rb] — custom test theme for ALAN (WIP).
- [`monokai.rb`][monokai.rb] — original `monokai` theme.
- [`monokai-adoc.css`][monokai-adoc.css] — extracted `monokai` CSS generated by Asciidoctor.

Reference documents:

- [`Rouge-Tokens.adoc`][Rouge-Tokens.adoc]
- [`Rouge-Tokens.html`][Rouge-Tokens.html] ([Live HTML Preview][Tokens Live])


# Asciidoctor HTML Tags

This how Asciidoctor renders by default an ALAN source block (`[source,alan]`) in the generated HTML doc:

```html
<div class="listingblock">
    <div class="content">
        <pre class="rouge highlight">
            <code data-lang="alan">
```

Since our goal is to provide a different theme for each syntax, and allow different themes for ALAN sources (via roles), we need to tweak the generated tags — just like we've done so far with Highlight, using Haml templates.

With Rouge, the solution doesn't lie with Haml templates, but consists in overriding the default tags generated by its native API method `format`, via our [`custom-rouge-adapter.rb`][custom-rouge-adapter.rb]:


```ruby
class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'
  # [...]
  def format node, lang, opts
    opts[:transform] = proc do |pre, code|
      code['class'] = %(language-#{lang}) if lang
      # Add to the generated <pre> tag  the`lang=` attribute,
      # in order to control CSS styling of code blocks:
      #   <pre class="rouge highlight" lang="alan">
      pre['lang'] = %(#{lang}) if lang
    end
    super
  end

end
```

Here's how our customized HTML for Asciidoctor and Rouge looks like:

```html
<div class="listingblock">
    <div class="content">
        <pre class="rouge highlight" lang="alan">
            <code class="language-alan" data-lang="alan">
```

Thanks to the extra `lang="alan` on the `<pre>` tag, and the `language-alan` class on the `<code>` tag, we're able to gain full control over the styles of source code block, on a per-language bases.

We also have two alternative themes for ALAN, associated with the `lib` and `tutorial` roles (=classes), which are controlled via an additional class on the root listingblock div element:

```html
<div class="listingblock lib">
```

# License and Credits

The [`monokai.rb`][monokai.rb] theme was taken from Rouge repository:

- https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/themes/monokai.rb

which is Copyright © 2012 by Jeanine Adkisson, released under the terms of the MIT License:

- https://github.com/rouge-ruby/rouge/blob/master/LICENSE

```
MIT License

Copyright (c) 2012 Jeanine Adkisson.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>


<!-- project files and folders -->

[monokai.rb]: ./monokai.rb
[monokai-adoc.css]: ./monokai-adoc.css

[alan-b16-eighties.rb]: ./alan-b16-eighties.rb "Rouge theme: Base16 Eighties"
[alan-tester.rb]: ./alan-tester.rb "Rouge theme: ALAN Tester"

[Rouge-Tokens.adoc]: ./Rouge-Tokens.adoc
[Rouge-Tokens.html]: ./Rouge-Tokens.html
[Tokens Live]: https://htmlpreview.github.io/?https://github.com/alan-if/Alan-Testbed/blob/master/syntax-hl/Rouge/themes/Rouge-Tokens.html "Live HTML Preview of 'Rouge-Tokens.htm'"

[custom-rouge-adapter.rb]: ../custom-rouge-adapter.rb


<!-- EOF -->
