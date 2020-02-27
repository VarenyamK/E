class Scraper
  def scrape
    # create an array to hold all of the sections
    classes = []
    # get url to be scraped
    url = 'https://web.cse.ohio-state.edu/oportal/schedule_display'
    # mechanize and parse the page with Mechanize and Nokogiri
    agent = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
    unparsed_page = agent.get(url).body
    parsed_page = Nokogiri::HTML(unparsed_page)
    # get array of all instances of div panel, this gets all the classes
    class_names = parsed_page.css('div.panel.panel-default')
    # for each classes get necessary info
    class_names.each do |class_name|

      # the title will be in the 'a' sections
      title = class_name.css('a').text
      title = title.split[0..1].join(' ')
      # there are subgroups in the div panel (group 0 and group 1 ) to get
      # information divide into arrays of these groups
      subgroups0 = class_name.css('tr.group0')
      # for each subgroup get the necessary components from table
      subgroups0.each do |subgroup|
        variables = subgroup.css('td')

        section = {  class_id: title,
                     section: variables[0].text,
                     component: variables[1].text,
                     time: variables[3].text,
                     location: variables[2].text,
                     professor: variables[4].text
        }
        # put in array
        classes << section
      end

      # do the same for the other group of subgroup 1
      subgroups1 = class_name.css('tr.group1')
      subgroups1.each do |subgroup|
        # get necessary elements from the table in that subgroup
        variables = subgroup.css('td')

        section = {  class_id: title,
                     section: variables[0].text,
                     component: variables[1].text,
                     time: variables[3].text,
                     location: variables[2].text,
                     professor: variables[4].text
        }
        # put in the array
        classes << section
      end


    end
    # return the scraped array
    classes
  end
end

