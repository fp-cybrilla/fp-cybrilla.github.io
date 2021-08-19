require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class Redcarpet::Render::CustomHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def table(header, body)
    "<table class='table-default table-auto'>" \
      "<thead>#{header}</thead>" \
      "<tbody>#{body}</tbody>" \
    "</table>"
  end

  def block_quote(quote)
    '<div class="block-quote mt-8">' \
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
end