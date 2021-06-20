=begin
require 'rouge'
require './alan3.rb'

class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'
end
=end

class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  # defer loading rouge until the load_library method is called:
  def load_library
    require 'rouge'
    require './alan3.rb'
    :loaded
  end
end
