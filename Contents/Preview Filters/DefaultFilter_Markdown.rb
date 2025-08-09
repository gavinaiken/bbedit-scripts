#!/usr/bin/env ruby

require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class MarkdownHighlightRender < Redcarpet::Render::HTML
 def initialize(extensions = {})
	 super extensions.merge(link_attributes: { target: '_blank' })
 end
 include Rouge::Plugins::Redcarpet
end

r = Redcarpet::Markdown.new(MarkdownHighlightRender, 
  :autolink => true,
  :space_after_headers => true,
  :fenced_code_blocks => true,
  :disable_indented_code_blocks => true,
  :no_intra_emphasis => true,
  :lax_html_blocks => true,
  :strikethrough =>true,
  :tables => true)

input = ARGF.read
