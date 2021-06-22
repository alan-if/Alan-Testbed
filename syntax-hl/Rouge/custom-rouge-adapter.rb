class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  # defer loading rouge until the load_library method is called:
  def load_library
    require 'rouge'
    require './alan3.rb'
    require './themes/alan-b16-eighties.rb'
    :loaded
  end

  def format node, lang, opts
    opts[:transform] = proc do |pre, code|
      # <pre class="highlight" lang="alan">
      # pre['class'] = 'rouge'
      pre['lang'] = %(#{lang}) if lang
      # from original example:
      code['class'] = %(language-#{lang}) if lang
    end
    super
  end

end
