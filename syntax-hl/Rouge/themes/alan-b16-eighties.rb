# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
Custom Rouge theme for ALAN syntax (WIP); elements are added to the theme as
they are implemented in the ALAN syntax. Mainly for testing purposes.

Base16 Eighties Author: Chris Kempson (http://chriskempson.com)
Source: https://github.com/chriskempson/base16-default-schemes
================================================================================
=end

module Rouge
  module Themes
    class Eighties < CSSTheme
      name 'eighties'

      palette :base00   => '#2d2d2d'
      palette :base01   => '#393939'
      palette :base02   => '#515151'
      palette :base03   => '#747369'
      palette :base04   => '#a09f93'
      palette :base05   => '#d3d0c8'
      palette :base06   => '#e8e6df'
      palette :base07   => '#f2f0ec'
      palette :base08   => '#f2777a'
      palette :base09   => '#f99157'
      palette :base0A   => '#ffcc66'
      palette :base0B   => '#99cc99'
      palette :base0C   => '#66cccc'
      palette :base0D   => '#6699cc'
      palette :base0E   => '#cc99cc'
      palette :base0F   => '#d27b53'

      style Text,
            Operator,                 :fg => :base05, :bg => :base00
      style Comment,
            Comment::Multiline,
            Comment::Single,          :fg => :base04, :italic => true
      style Name,                     :fg => :base07
      style Name::Builtin,            :fg => :base0A
      style Literal::Number,          :fg => :base09
      style Keyword::Reserved,
            Punctuation,              :fg => :base08
      style Str::Double,
            Str::Single,              :fg => :base0B
      style Str::Double::Delimiter,   :fg => :base0A
      style Str::Escape,              :fg => :base0E
      style Str::Interpol,            :fg => :base0C

    end
  end
end
