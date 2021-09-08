require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class Redcarpet::Render::CustomHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def table(header, body)
    "<table class='table-default table-auto'>" \
      "<thead class='sticky top-0'>#{header}</thead>" \
      "<tbody>#{body}</tbody>" \
    "</table>"
  end

  def block_quote(quote)
    '<div class="block-quote mt-8 ml-4">' \
      '<span class="block-quote-icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
          <g transform="translate(-296 -694)">
            <circle fill="#9254de" cx="16" cy="16" r="16" transform="translate(296 694)"></circle>
            <g transform="translate(-2073.991 -3427.991)">
              <path fill="#ffffff" d="M9,0A9,9,0,1,1,0,9,9,9,0,0,1,9,0Z" transform="translate(2376.991 4128.991)"></path>
              <rect fill="#9254de" width="2" height="9" rx="1" transform="translate(2384.991 4134.991)"></rect>
              <circle fill="#9254de" cx="1" cy="1" r="1" transform="translate(2384.991 4131.991)"></circle>
            </g>
          </g>
        </svg>
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
      "<a href='#{link}' title='#{title}' class='inline-flex items-center bg-primary-N05 hover:bg-primary-N10 hover:text-primary-B100 px-2 rounded-5'
        target='_blank'
      >
        #{content}
        <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16' class='inline ml-2'>
          <g transform='translate(16.215 -0.215) rotate(90)'>
            <g transform='translate(0.35 0.35)'>
              <rect fill='none' width='16' height='16' transform='translate(-0.135 -0.135)' />
            </g>
            <path fill='#3e74ff' d='M4.85,13.5a.5.5,0,0,1-.056-.062L.2,9.1a.629.629,0,0,1,0-.927.72.72,0,0,1,.98,0l4.162,3.935L9.507,8.175a.72.72,0,0,1,.98,0,.629.629,0,0,1,0,.927L5.9,13.44a.522.522,0,0,1-.06.062.7.7,0,0,1-.492.189H5.331A.7.7,0,0,1,4.85,13.5ZM9.507,5.519,5.346,1.583,1.184,5.519a.72.72,0,0,1-.98,0,.63.63,0,0,1,0-.928L4.791.254A.409.409,0,0,1,4.85.191.716.716,0,0,1,5.342,0h0a.7.7,0,0,1,.5.191A.386.386,0,0,1,5.9.254l4.59,4.337a.63.63,0,0,1,0,.928A.713.713,0,0,1,10,5.711.7.7,0,0,1,9.507,5.519Z' transform='translate(2.869 1.493)' />
          </g>
        </svg>
      </a>"
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
        <span class='copy-link flex items-center hidden cursor-pointer text-size-12 ml-2 py-0.5 px-2 bg-primary-B10 text-primary-B100 rounded-xl'>
        <svg xmlns='http://www.w3.org/2000/svg' width=18 height=18 viewBox='0 0 18 18'>
          <path fill='none' d='M0,0H18V18H0Z' />
          <path fill='#3e74ff' d='M5.429,17.7a2.316,2.316,0,0,1,2.331-2.3h3.007V14H7.759a3.7,3.7,0,1,0,0,7.407h3.007V20H7.759A2.316,2.316,0,0,1,5.429,17.7Zm3.083.741h6.015V16.963H8.511ZM15.278,14H12.27v1.407h3.007a2.3,2.3,0,1,1,0,4.592H12.27v1.407h3.007a3.7,3.7,0,1,0,0-7.407Z' transform='translate(-2.519 -9.007)' />
        </svg>
        <span class='ml-1'>Copy link</span>
        </span>
      </h#{level}>"
    else
      "<h#{level}>
        #{text}
      </h#{level}>"
    end
  end
end
