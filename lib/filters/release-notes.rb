require "nokogiri";

class ReleaseNotesFilter < Nanoc::Filter
  identifier :releaseNotes

  CHANGELOG_PATTERN = %r{<p>:ChangeLog\s(?<date>\[.*?\]).*?<\/p>(?<content>.*?)<p>:EndChangeLog.*?<\/p>}mx.freeze
  CONTENT_PATTERN = %r{<p>::Content\s?(?<title>\{.*?\})?(?<action>\*?)\s?(?<other>.*?)<\/p>(?<content>.*?)<p>::EndContent.*?<\/p>}mx.freeze

  def run(content, params = {})
    content = content.gsub(CHANGELOG_PATTERN) { generate_log(Regexp.last_match[:date], Regexp.last_match[:content]) }
    new_content = content.gsub(CONTENT_PATTERN) { generate_content(Regexp.last_match[:title], Regexp.last_match[:content], Regexp.last_match[:action], Regexp.last_match[:other]) }
    new_content;
  end

  def generate_content(title, content, action, other)
    output = '';
      output << "<div class='release-title'>";
        if(!action.empty?)
          output << "<span class='action-badge'>Action required</span>";
        end
        output << "<div>#{title.gsub('{', '').gsub('}', '')}#{other}</div>";
      output << "</div>";
      output << content;
  end

  def generate_log(date, content)
    output = '';
    output << "<div class='release-notes'>"
      output << "<div class='release-date'>"
        output << date.gsub('[', '').gsub(']', '');
      output << "</div>"

      output << "<div class='release-content'>"
        output << content;
      output << "</div>"
    output << '</div>'
  end
end