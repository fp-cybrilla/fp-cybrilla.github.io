require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class Redcarpet::Render::CustomHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end