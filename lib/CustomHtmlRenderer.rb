require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class Redcarpet::Render::CustomHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def table(header, body)
    "<div class='table-responsive'><table class='table-default table-striped table-auto'>" \
      "<thead class='sticky -top-1'>#{header}</thead>" \
      "<tbody>#{body}</tbody>" \
    "</table></div>"
  end

  def block_quote(quote)
    '<div class="block-quote mt-8">' \
      '<span class="block-quote-icon">
      </span>' \
      "<blockquote>#{quote}</blockquote>" \
    '</div>'
  end

  def list(content, list_type)
    case list_type
    when :ordered
      "<ol class='list-decimal pl-4'>#{content}</ol>"
    when :unordered
      if(content[''])
        "<ul class='task-list pl-5 mt-4'>#{content}</ul>"
      else
        "<ul class='list-disc pl-4'>#{content}</ul>"  
      end  
    end
  end

  def list_item(text, list_type)
    if list_type === :unordered && text.start_with?("[x]", "[X]")
      text[0..2] = ''
      %(<li class='list-none'>#{text}</li>)
    elsif list_type === :unordered && text.start_with?("[ ]")
      text[0..2] = ''
      %(<li class='list-none'>#{text}</li>)
    elsif list_type === :unordered
      %(<li style='list-style: disc'>#{text}</li>)
    else
      %(<li>#{text}</li>)
    end
  end

  def link(link, title, content)
    if content.split(",")[0] == "FPDocs"
      content[0..6] = ''
      "<a href='#{link}' title='#{title}' class='api-link inline-flex items-center hover:text-primary-B110'
        target='_blank'
      >
        #{content}
      </a>"
    elsif content.split(",")[0] == "newwindow"
        content[0..9] = ''
        "<a href='#{link}' title='#{title}' target='_blank'>#{content}</a>"
    else
      "<a href='#{link}' title='#{title}'>#{content}</a>"
    end
  end

  Anchor = Struct.new(:value, :level)

  def initialize(opts = {})
    super
    @anchors = []
  end

  def header(text, level)
    if(level == 2 || level == 3 )
      anchor = Anchor.new(text.downcase.gsub(' ', '-'), level)

      if @anchors.any? {|a| a.value == anchor.value}
        parent = @anchors.reverse.find {|a| a.level < level }
        anchor.value = [parent.value, anchor.value].join('-')
      end

      @anchors << anchor

      "<h#{level} id='#{anchor.value}' class='flex items-center copy'>
        <a href='##{anchor.value}' class='anchor'>#{text}</a>
        <span class='copy-link items-center cursor-pointer ml-4'>
          <span class='copy-icon'></span>
        </span>
      </h#{level}>"
    else
      "<h#{level}>
        #{text}
      </h#{level}>"
    end
  end
end
