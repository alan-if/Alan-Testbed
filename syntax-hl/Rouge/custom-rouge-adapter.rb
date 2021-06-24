class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  # Defer loading Rouge until the `load_library` method is called:
  def load_library
    require 'rouge'
    require './alan3.rb'
    require './themes/alan-tester.rb' # Custom theme for tests.
    :loaded
  end

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
