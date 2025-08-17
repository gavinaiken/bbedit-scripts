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

    ICONS = {
        note: %q(<svg version="1.1" width="16" height="16" viewBox="0 0 16 16" class="octicon" aria-hidden=""><path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8Zm8-6.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13ZM6.5 7.75A.75.75 0 0 1 7.25 7h1a.75.75 0 0 1 .75.75v2.75h.25a.75.75 0 0 1 0 1.5h-2a.75.75 0 0 1 0-1.5h.25v-2h-.25a.75.75 0 0 1-.75-.75ZM8 6a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"></path></svg>),
        tip: %q(<svg version="1.1" width="16" height="16" viewBox="0 0 16 16" class="octicon" aria-hidden=""><path d="M8 1.5c-2.363 0-4 1.69-4 3.75 0 .984.424 1.625.984 2.304l.214.253c.223.264.47.556.673.848.284.411.537.896.621 1.49a.75.75 0 0 1-1.484.211c-.04-.282-.163-.547-.37-.847a8.456 8.456 0 0 0-.542-.68c-.084-.1-.173-.205-.268-.32C3.201 7.75 2.5 6.766 2.5 5.25 2.5 2.31 4.863 0 8 0s5.5 2.31 5.5 5.25c0 1.516-.701 2.5-1.328 3.259-.095.115-.184.22-.268.319-.207.245-.383.453-.541.681-.208.3-.33.565-.37.847a.751.751 0 0 1-1.485-.212c.084-.593.337-1.078.621-1.489.203-.292.45-.584.673-.848.075-.088.147-.173.213-.253.561-.679.985-1.32.985-2.304 0-2.06-1.637-3.75-4-3.75ZM5.75 12h4.5a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5ZM6 15.25a.75.75 0 0 1 .75-.75h2.5a.75.75 0 0 1 0 1.5h-2.5a.75.75 0 0 1-.75-.75Z"></path></svg>),
        important: %q(<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"  class="octicon"><path d="M 8 3 C 8.414213 3 8.75 3.293814 8.75 3.65625 L 8.75 6.71875 C 8.75 7.081186 8.414213 7.375 8 7.375 C 7.585786 7.375 7.25 7.081186 7.25 6.71875 L 7.25 3.65625 C 7.25 3.293814 7.585786 3 8 3 Z M 8 10 C 7.447715 10 7 9.60825 7 9.125 C 7 8.64175 7.447715 8.25 8 8.25 C 8.552285 8.25 9 8.64175 9 9.125 C 9 9.60825 8.552285 10 8 10 Z"/><path d="M 0 2.000033 C 0 0.896015 0.896 0 2 0 L 14 0 C 15.103999 0 16 0.896015 16 2.000033 L 16 10.571606 C 16 11.676193 15.104569 12.571639 14 12.571639 L 9.211429 12.571639 L 6.270857 15.512259 C 5.794236 15.987082 5.311685 16.128698 4.690116 15.871269 C 4.068547 15.61384 3.662761 15.007874 3.661415 14.335097 L 3.661415 12.571639 L 2 12.571639 C 0.895431 12.571639 0 11.676193 0 10.571606 Z M 1.772969 1.560138 C 1.615173 1.560138 1.487255 1.688062 1.487255 1.845859 L 1.503717 11.036715 C 1.503717 11.194431 1.631717 11.322433 1.789432 11.322433 L 4.315265 11.278775 C 4.788652 11.278775 5.172408 11.662539 5.172408 12.135933 L 5.172408 14.638831 L 8.28098 11.530208 C 8.4415 11.369307 8.659418 11.27885 8.886694 11.278775 L 14.284224 11.278775 C 14.442019 11.278775 14.569937 11.150854 14.569937 10.993056 L 14.540385 5.16677 L 14.553474 1.802199 C 14.553474 1.644402 14.425555 1.516479 14.267759 1.516479 Z"/></svg>),
        warning: %q(<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" class="octicon"><path d="M6.457 1.047c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0 1 14.082 15H1.918a1.75 1.75 0 0 1-1.543-2.575Zm1.763.707a.25.25 0 0 0-.44 0L1.698 13.132a.25.25 0 0 0 .22.368h12.164a.25.25 0 0 0 .22-.368Zm.53 3.996v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0ZM9 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"/></svg>),
        caution: %q(<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" class="octicon"><path d="M4.47.22A.749.749 0 0 1 5 0h6c.199 0 .389.079.53.22l4.25 4.25c.141.14.22.331.22.53v6a.749.749 0 0 1-.22.53l-4.25 4.25A.749.749 0 0 1 11 16H5a.749.749 0 0 1-.53-.22L.22 11.53A.749.749 0 0 1 0 11V5c0-.199.079-.389.22-.53Zm.84 1.28L1.5 5.31v5.38l3.81 3.81h5.38l3.81-3.81V5.31L10.69 1.5ZM8 4a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0v-3.5A.75.75 0 0 1 8 4Zm0 8a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/></svg>)
    }

    def initialize(extensions = {})
        super extensions.merge(link_attributes: { target: '_blank' })
    end

    def preprocess(markdown_doc)
        nested_md = Redcarpet::Markdown.new(self, {})
        markdown_doc.gsub!(/^> \[!(?<type>NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]$\n(?<content>^> .*\n)+/) do | match |
            type = $~[:type].downcase.to_sym
            %Q(
                \n<div class="alert alert-#{type.downcase}">
                    <p class='alert-title'>#{ICONS[type]} #{type.capitalize}</p>
                    #{nested_md.render($~[:content].gsub!(/^> /, ''))}
                </div>
            )
        end
        markdown_doc
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
