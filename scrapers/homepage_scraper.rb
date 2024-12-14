require "watir"
require "nokogiri"

module Scrapers
  class HomepageScraper
    def self.scrape
      browser = Watir::Browser.new :chrome, headless: true
  
      url = "https://demo.testfire.net/index.jsp"
  
      browser.goto url
      puts "Opening page #{url}..."
  
      # For parsing HTML text to Ruby object
      doc = Nokogiri::HTML(browser.html)
  
      posts = []
  
      doc.css("td").each do |td|
        td.children.each do |node|
          if node.name == "b"
            link = node.at_css("a")
            next unless link
  
            title = link.text.strip
            href = link["href"]
            description = []
            image = nil
  
            sibling = node.next_sibling
            while sibling && !(sibling.name == "b" || sibling.name == "br" && sibling.next_sibling&.name == "b")
              if sibling.text?
                text = sibling.text.strip
                description << text unless text.empty?
              elsif sibling.name == "center"
                img = sibling.at_css("img")
                image = img["src"] if img
              end
              sibling = sibling.next_sibling
            end
  
            posts << {
              title: title,
              link: href,
              description: description.join(" "),
              image: image
            }
          end
        end
      end
      puts "Scraping homepage posts..."
  
      browser.close
      puts "Closing browser..."
  
      puts "Successfully scrape homepage posts with the following data:\n"
      puts posts
    end
  end  
end

# Allow the script to be run directly
if __FILE__ == $0
  Scrapers::HomepageScraper.scrape
end
