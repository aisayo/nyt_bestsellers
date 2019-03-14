require 'nokogiri'
require 'open-uri'

class Scraper
  
  def page
    Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    puts page.class   # => Nokogiri::HTML::Document
  end 
  
  def scrape_bestsellers_index
    self.page.css()
  end 
  
  def add_bestsellers
    scrape_bestsellers_index.each do |b|
      NewYorkTimesBestsellers::Bestsellers.new_from_index_page(b)
    end 
  end 
end 