require 'nokogiri'
require 'open-uri'
require 'pry'

class NYT_Bestsellers::Bestsellers 
  
  attr_accessor :title, :author, :category, :description
  
  @@all = []
  
  def initialize(title, author, category, description)
    @title = title 
    @author = author 
    @category = category 
    @description = description
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.find_bestseller(i)
    self.all[i.to_i - 1]
  end 
  
  def save
    @@all << self 
  end 
  
  def self.scrape_info
    bestsellers = []
    
    bestsellers << self.scrape_fiction
    bestsellers << self.scrape_nonfiction
    bestsellers << self.scrape_childrens
  end 
  
  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))
    category = doc.css("div.html.content-node div.html-embed-container").first.text
    title = doc.css("div.product-shelf-title.pr-m").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author.contributors").text.gsub(/\t/, "")
    description = doc.css("div.text--medium.overview-content").text.gsub(/\t/, "")
    
    fiction = self.new(category, title, author, description)
  end 
  
  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    category = doc.css("div.html.content-node div.html-embed-container").text
    title = doc.css("div.product-shelf-title.pr-m h3.product-info-title a").text
    author = doc.css("div.product-shelf-author.contributors").text
    description = doc.css("div.text--medium.overview-content").text
    
    nonfiction = self.new(category, title, author, description)
  end 
  
  def self.scrape_childrens
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-childrens-picture-books/_/N-1p3p"))
    category = doc.css("div.html.content-node div.html-embed-container").first.text
    title = doc.css("div.product-shelf-title.pr-m").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author.contributors").text.gsub(/\t/, "")
    description = doc.css("div.text--medium.overview-content").text.gsub(/\t/, "")
    
    childrens = self.new(category, title, author, description)
  end 
  
end 



