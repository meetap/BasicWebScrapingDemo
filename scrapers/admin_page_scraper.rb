require "watir"
require "nokogiri"

module Scrapers
  class AdminPageScraper
    def self.scrape
      browser = Watir::Browser.new :chrome, headless: true
  
      url = "https://demo.testfire.net/index.jsp"
  
      browser.goto url
      puts "Opening page #{url}..."
  
      browser.link(id: "LoginLink").click
      puts "Clicking the login link..."
  
      browser.text_field(name: "uid").set "admin"
      puts "Inserting username value..."
  
      browser.text_field(name: "passw").set "admin"
      puts "Inserting password value..."
  
      browser.input(name: "btnSubmit").click
      puts "Clicking login button..."
  
      browser.input(id: "btnGetAccount").click
      puts "Opening account data..."
  
      doc = Nokogiri::HTML(browser.html)
  
      # Extract Balance Detail
      balance_detail = {}
      balance_header = doc.at_xpath('//th[contains(text(), "Balance Detail")]')
      if balance_header
        balance_table = balance_header.ancestors("table").first
        balance_table.css("tr").each do |row|
          cells = row.css("td, th").map { |cell| cell.text.strip }
          next if cells.length < 2
          key = cells[0].downcase.gsub(" ", "_").gsub(/\W/, "")
          balance_detail[key] = cells[1]
        end
      end
  
      # Extract Recent Transactions
      recent_headers = %w[date description amount]
      recent_transactions = parse_transactions(doc, "recent", recent_headers)
  
      # Extract Credits
      credits_headers = %w[account date description amount]
      credits = parse_transactions(doc, "credits", credits_headers)
  
      # Extract Debits
      debits_headers = %w[account date description amount]
      debits = parse_transactions(doc, "debits", debits_headers)
  
      data = {
        balance_detail: balance_detail,
        recent_transactions: recent_transactions,
        credits: credits,
        debits: debits
      }
      puts "Scraping bank account data..."
  
      browser.close
      puts "Closing browser..."
  
      puts "Successfully scrape bank account data with the following value:\n"
      puts data
    end
  
    # Function to parse transactions
    def self.parse_transactions(doc, div_id, headers)
      transactions = []
      table = doc.at("div##{div_id} table tbody")
      return transactions unless table
  
      table.css("tr").each do |row|
        cells = row.css("td").map { |cell| cell.text.strip }
        next if cells.empty? || cells.length < headers.length
  
        transaction = {}
        headers.each_with_index do |header, index|
          transaction[header.to_sym] = cells[index]
        end
        transactions << transaction
      end
      transactions
    end
  end  
end

# Allow the script to be run directly
if __FILE__ == $0
  Scrapers::AdminPageScraper.scrape
end
