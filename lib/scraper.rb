require 'nokogiri'
require 'open-uri'

class NewYorkTimesBestsellers::Scraper
  
    attr_accessor :title, :author, :genre, :description, :url
  
  @@all = []
  
  def initialize(title=nil, author=nil, url=nil)
    @name = name 
    @title = title 
    @author = author 
    @genre = genre 
    @description = description
    @url = url 
    @doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/#{week}"))
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def scrape 
    scrape_details
    @fiction
    @nonfiction
    @childrens
  end 
  
  def scrape_details
    date = @doc.search("<div class="date-range tooltip" data-tooltip="Lists are published early online"> == $0   </div>")
    # <div class="date-range tooltip" data-tooltip="Lists are published early online">March 24, 2019    </div>
  end 
  
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