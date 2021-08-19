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
end