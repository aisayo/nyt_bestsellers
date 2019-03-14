require 'nokogiri'
require 'open-uri'

class NewYorkTimesBestsellers::Scraper
  
    attr_accessor :name, :title, :author, :genre, :description, :url
  
  @@all = []
  
  def initialize(name=nil, title=nil, author=nil, url=nil)
    @name = name 
    @title = title 
    @author = author 
    @genre = genre 
    @description = description
    @url = url 
    @@all << self 
  end 
  
  def self.all 
    @@all
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