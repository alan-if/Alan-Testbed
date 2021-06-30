# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
Custom Rouge theme for testing the ALAN lexer (WIP); elements are added to the
theme as they are implemented in the ALAN syntax.
================================================================================
=end

module Rouge
  module Themes
    class AlanTester < CSSTheme
      name 'alan-tester'

      palette :black    => '#000000'
      palette :blue     => '#0b8dff'
      palette :brown    => '#c19a6b'
      palette :cyan     => '#5adaff'
      palette :green    => '#2ecb55'
      palette :grey     => '#aaaaaa'
      palette :magenta  => '#ff00ff'
      palette :orange   => '#ffae2b'
      palette :pink     => '#ffbcd9'
      palette :purple   => '#b180ed'
      palette :red      => '#ff0000'
      palette :white    => '#ffffff'
      palette :yellow   => '#ffff00'


      style Text,                     :fg => :grey, :bg => :black
      style Operator,                 :fg => :cyan
      style Comment,
            Comment::Multiline,
            Comment::Single,          :fg => :brown, :italic => true
      style Name,                     :fg => :white
      style Name::Builtin,            :fg => :blue, :bold => true
      style Name::Other,              :fg => :blue, :italic => true
      style Literal::Number,          :fg => :yellow
      style Keyword::Reserved,        :fg => :red, :bold => true
    # style Keyword::Pseudo,          :fg => :red, :bold => true
      style Punctuation,              :fg => :pink
      style Str::Double,
            Str::Single,              :fg => :green
      style Str::Double::Delimiter,   :fg => :yellow
      style Str::Escape,              :fg => :purple
      style Str::Interpol,            :fg => :orange
      style Error,                    :fg => :white, :bg => :red

    end
  end
end
