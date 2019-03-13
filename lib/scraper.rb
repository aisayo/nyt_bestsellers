require 'nokogiri'
require 'open-uri'

class NewYorkTimesBestsellers::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end 
  
  def scrape_bestsellers_index
    self.get_page.css()
  end 
  
  def add_bestsellers
    scrape_bestsellers_index.each do |b|
      NewYorkTimesBestsellers::Bestsellers.new_from_index_page(b)
    end 
  end 
end 