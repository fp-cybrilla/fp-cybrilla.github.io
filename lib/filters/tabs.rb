require "nokogiri";

class TabsFilter < Nanoc::Filter
  identifier :tabs

  TABS_PATTERN = %r{<p>:Tabs.*?</p>(?<tabs_wrapper>.*?)<p>:EndTabs.*?</p>}mx.freeze
  TAB_TITLE_PATTERN = %r{<p>::TabTitle\s(?<tab_title>.*?)</p>}mx.freeze
  TAB_CONTENT_PATTERN = %r{<p>:::TabContent.*?</p>(?<tab_content>.*?)<p>:::EndTabContent.*?</p>}mx.freeze

  def run(content, params = {})
    new_content = content.gsub(TABS_PATTERN) { generate_wrapper(Regexp.last_match[:tabs_wrapper]) }
    title_wrapper = new_content.gsub(TAB_TITLE_PATTERN) { generate_titles(Regexp.last_match[:tab_title]) }
    content_wrapper = title_wrapper.gsub(TAB_CONTENT_PATTERN) { generate_content_wrapper(Regexp.last_match[:tab_content]) }
    if(TABS_PATTERN.match(content))
      doc = Nokogiri::HTML(content_wrapper);
      doc.css('div.tabs.js-tabs').each do |item|
        # creating a node for tabs-bar
        tabs_bar_tag = doc.create_element "div", :class => "tabs-bar";

        # creating a node for tabs-content
        tabs_content_tag = doc.create_element "div", :class => "tabs-content";

        item.add_child(tabs_bar_tag);
        item.add_child(tabs_content_tag);

        item.css('div.tab-title').each_with_index do |child, index|
          if(index === 0)
            child.append_class('active');
          end
          tabs_bar_tag.add_child(child);
        end

        item.css('div.tab-pane').each_with_index do |child, index|
          if(index === 0)
            child.append_class('active');
          end
          tabs_content_tag.add_child(child);
        end
      end
      doc.to_html;
    else
      content_wrapper;
    end
  end

  def generate_content_wrapper(content)
    output = '';
    output << '<div class="tab-pane">'
      output << content
    output << '</div>'
  end

  def generate_titles(content)
    output = '';
    output << '<div class="tabs-item tab-title">'
      output << content
    output << '</div>'
  end

  def generate_wrapper(content)
    output = '';
    output << '<div class="tabs js-tabs">'
        output << content
    output << '</div>'
  end
end
