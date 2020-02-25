require 'nokogiri'
require 'httparty'
require 'byebug'
class Scraper
  def scrape
    classes = []
    url = "https://web.cse.ohio-state.edu/oportal/schedule_display"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    class_names = parsed_page.css('div.panel.panel-default')
    class_names.each do |class_name|

      title = class_name.css('a').text
      subgroups0 = class_name.css('tr.group0')
      subgroups0.each do |subgroup|
        variables = subgroup.css('td')

        section = {
            class_id: title,
            section: variables[0].text,
            component: variables[1].text,
            time: variables[3].text,
            location: variables[2].text,
            professor: variables[4].text
        }
        classes << section
      end

      subgroups1 = class_name.css('tr.group1')
      subgroups1.each do |subgroup|
        variables = subgroup.css('td')

        section = {
            class_id: title,
            section: variables[0].text,
            component: variables[1].text,
            time: variables[3].text,
            location: variables[2].text,
            professor: variables[4].text
        }
        classes << section
      end


    end

    classes
  end
end

