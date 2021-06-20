# -*- coding: utf-8 -*- #
# frozen_string_literal: true

module Rouge
  module Lexers
    class Alan3 < RegexLexer
      title "Alan IF v3"
      desc "Alan IF v3 (www.alanif.se)"

      tag 'alan3'
      aliases 'alan-if', 'alan'

      # @FIXME: The '*.i' extension clashes with OpenEdge!
      filenames '*.alan' # , '*.i'

      mimetypes 'text/x-alan-if', 'application/x-alan-if',
                'text/x-alan3', 'application/x-alan3'

      def self.keywords_generic
        @keywords_generic ||= Set.new %w(
          add after an and are article at attributes before between by can
          cancel character characters check container contains count current
          decrease definite depend depending describe description directly do
          does each else elsif empty end entered event every exclude exit
          extract first for form from has header here if  in include increase
          indefinite indirectly initialize into is isa it last limits list
          locate look make max mentioned message meta min name near nearby
          negative no not of off on only opaque option options or  prompt
          pronoun quit random restart restore save say schedule score script
          set  start step stop strip style sum synonyms syntax system taking
          the then this to transcript transitively until use verb visits wait
          when where with word words
        )
      end

      # Keywords which are followed by: '<filename>'.
      def self.keywords_file
        @keywords_file ||= Set.new %w(
          import play show
        )
      end

      # LETTER: 'a-zA-Zà-þ&&[^÷]' # <= [a-zA-Z\x{00E0}-\x{00FE}&&[^\x{00F7}]]
      # ID: '(\b[{{LETTER}}][0-9_{{LETTER}}]*\b)'

      # Valid ID letters are: 'a-z', 'A-Z' and 'U+00E0-U+00FE' ~'U+00F7' (÷)
      letter = 'a-zA-Zà-þ&&[^÷]'
      id = /[#{letter}][0-9_#{letter}]*/
      # id = /[a-zA-Zà-þ&&[^÷]][0-9_a-zA-Zà-þ&&[^÷]]*/

      state :whitespace do
        rule %r/\s+/, Text::Whitespace
      end

      state :root do
        mixin :whitespace
        # Comment single line
        rule %r(--[^\n]*), Comment::Single

        # Strings
        rule %r/"/, Str::Double::Delimiter, :string


        # Operators
        ###########
        # Arythmetic: '+', '-', '*', '/'
        # Comparison: '=', '<', '>', '<=', '>=', '<>', '=='
        # Other:
        #   (1) parameter indicators: '!', '*'
        # NOTE: This RegEx is designed to avoid capturing '=>' as an operator, because we
        #       want to capture it as a keyword (shorthand for 'THEN'). Otherwise it could
        #       have been optimized to be much shorter.
        rule %r/\+|\-|\*|\/|<|(?<!\=)>|<>|<\=|>\=|\=(?!>)|\=\=|\(|\)|\{|\}|!/, Operator

        # Punctuation
        rule %r/[\.:,]/, Punctuation

        # Numbers
        rule %r/\d+/, Num

        # Reserved Keywords
        ###################
        rule %r(=>), Keyword::Reserved

        rule id do |m|
          name = m[0].downcase
          if self.class.keywords_file.include? name
            # Keywords which are followed by a filename:
            token Keyword::Reserved
            push :filename
          elsif self.class.keywords_generic.include? name
            # all other keywords...
            token Keyword::Reserved
          else
            # Just an identifier...
            token Name
          end
        end

        # Quoted ID
        rule %r/'/, Name, :quoted_id

      end # :root

      state :filename do
        mixin :whitespace
        rule %r/'/, Str::Delimiter, :file_id
        rule %r//, Punctuation, :pop! # Force pop back to parent context!!
      end

      state :file_id do
        mixin :whitespace
        rule %r/''/, Str::Escape
        rule %r/'/, Str::Delimiter, :pop!
        rule %r/[^']+/, Str::Single
      end


      state :quoted_id do
        rule %r/''/, Str::Escape
        rule %r/'/, Name, :pop!
        rule %r/[^']+/, Name
      end

      state :string do
        # $<n>   The parameter <n> (<n> is a digit > 0, e.g. "$1")
        # $+<n>  Definite form of parameter <n>
        # $0<n>  Indefinite form of parameter <n>
        # $-<n>  Negative form of parameter <n>
        # $!<n>  Pronoun for the parameter <n>
        # $a     The name of the actor that is executing
        # $l     The name of the current location
        # $o     The current object (first parameter) [DEPRECATED]
        # $v     The verb the player used (the first word)
        rule %r/\$[+\-!0]?[1-9]|\$[alov]/, Str::Interpol
        # $$  Escape from automatic space insertion and capitalization
        # $_  Print this as a '$' if in conflict with other symbols
        # $i  Indent on a new line
        # $n  New line
        # $p  New paragraph (usually one empty line)
        # $t  Insert a tabulation
        rule %r/[\$][\$_inpt]|""/, Str::Escape
        rule %r/"/, Str::Double::Delimiter, :pop!
        rule %r/[^\$"]+/, Str::Double
      end


    end # class
  end
end
