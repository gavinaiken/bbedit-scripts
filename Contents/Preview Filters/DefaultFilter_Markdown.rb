#!/usr/bin/env ruby

require 'redcarpet'

r = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
  :autolink => true,
  :space_after_headers => true,
  :fenced_code_blocks => true,
  :disable_indented_code_blocks => true,
  :no_intra_emphasis => true,
  :lax_html_blocks => true,
  :strikethrough =>true,
  :tables => true)

input = ARGF.read

puts r.render(input)

