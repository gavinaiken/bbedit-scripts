#!/usr/bin/env ruby

require 'redcarpet'

module Compatability
    private
    
    def hightlighting?
        require 'rouge'
        require 'rouge/plugins/redcarpet'
    rescue LoadError
        false
    end
end

class SyntaxHighlightRenderer < Redcarpet::Render::HTML	
    extend Compatability
    include Rouge::Plugins::Redcarpet if hightlighting?
    
    def initialize(extensions = {})
        super extensions.merge(link_attributes: { target: '_blank' })
    end
end

md_to_html = Redcarpet::Markdown.new(
    SyntaxHighlightRenderer, 
    :autolink => true,
    :space_after_headers => true,
    :fenced_code_blocks => true,
    :disable_indented_code_blocks => true,
    :no_intra_emphasis => true,
    :lax_html_blocks => true,
    :strikethrough =>true,
    :tables => true
  )

input_markdown = ARGF.read

puts md_to_html.render(input_markdown)
