require 'pry'

class NewYorkTimesBestsellers::Bestsellers 
  
  attr_accessor :title, :author, :category, :description, :url
  
  @@all = []
  
  def initialize(title=nil, author=nil, url=nil)
    @title = title 
    @author = author 
    @@category = category 
    @description = description
    @url = url 
    
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  def self.find_bestseller(i)
    self.all[i.to_i - 1]
  end 
  
  def self.scrape_info
    bestsellers = []
    
    bestsellers << self.scrape_fiction
    bestsellers << self.scrape_nonfiction
    bestsellers << self.scrape_childrens
  end 
  
  def self.scrape_fiction
    html = open("https://owwl.org/bestsellers/list/Combined+Print+and+E-Book+Fiction")
    doc = Nokogiri::HTML(html)
    title = doc.css("div.row l-title").text.gsub(/\t/, "")
    category = doc.css("bestsellers_lists > li:nth-child(6) > a").text
    
    fiction = self.new(title, author, category)
  end 
  
  def self.scrape_nonfiction
  end 
  
  def self.scrape_childrens
  end 
  
end 



