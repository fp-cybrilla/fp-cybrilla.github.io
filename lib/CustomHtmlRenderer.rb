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

      "<h#{level} id='#{anchor.value}' class='inline-flex items-center copy relative'>
        <a href='##{anchor.value}' class='anchor pr-7'>#{text}</a>
        <span class='copy-link items-center cursor-pointer ml-4 absolute right-0'>
          <span class='copy-icon'></span>
        </span>
      </h#{level}>"
    else
      "<h#{level}>
        #{text}
      </h#{level}>"
    end
  end

  def block_code(code, language)
    if(language == 'mermaid')
      "<div class='mermaid'>#{code}</div>"
    else
      super;
    end
  end


  ACCORDION_PATTERN = %r{<p>:Accordion</p>(?<acc_wrapper>.*?)<p>:EndAccordion</p>}mx.freeze
  ITEM_PATTERN = %r{<p>::AccordionItem</p>(?<item_wrapper>.*?)<p>::EndAccordionItem</p>}mx.freeze
  CONTENT_PATTERN = %r{<p>::::AccordionContent</p>(?<content_wrapper>.*?)<p>::::EndAccordionContent</p>}mx.freeze
  TITLE_PATTERN = %r{<p>:::AccordionTitle\s(?<tab_title>.*?)</p>}mx.freeze

  def postprocess(content)
    new_content = content.gsub(ACCORDION_PATTERN) { generate_wrapper(Regexp.last_match[:acc_wrapper]) }
    abc = new_content.gsub(ITEM_PATTERN) { generate_item_wrapper(Regexp.last_match[:item_wrapper]) }
    pqr = abc.gsub(CONTENT_PATTERN) { generate_content_wrapper(Regexp.last_match[:content_wrapper]) }
    pqr.gsub(TITLE_PATTERN) { generate_titles(Regexp.last_match[:tab_title]) }
  end

  def generate_content_wrapper(content)
    output = '';
    output << '<div class="accordion-content hidden">'
        output << content
    output << '</div>'
  end

  def generate_titles(content)
    output = '';
    output << '<div class="accordion-title" aria-expanded="collapse">'
        output << content
    output << '</div>'
  end

  def generate_item_wrapper(content)
    output = '';
    output << '<div class="accordion-item">'
      output << content
    output << '</div>'
  end

  def generate_wrapper(content)
    output = '';
    output << '<div class="accordion">'
      output << content
    output << '</div>'
  end
end
