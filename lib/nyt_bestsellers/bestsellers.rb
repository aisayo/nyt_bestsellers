require 'nokogiri'
require 'open-uri'
require 'pry'

class NYT_Bestsellers::Bestsellers 
  
  attr_accessor :title, :author, :category
  
  @@all = []
  
  def initialize(title, author)
    @category = category
    @title = title 
    @author = author 
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  
  def self.bestsellers(i)
    self.all[i.to_i - 1]
  end 
  
  def self.scrape_fiction
    self.all[i.to_i - 1]
  end 
  
  def self.scrape_nonfiction
    self.all[i.to_i - 1]
  end 
  
  def self.scrape_childrens
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
    # category = doc.css("div.row.topX-row").text.gsub(/\t/, "")
    title = doc.css("div.product-shelf-title.pr-m").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author.contributors").text.gsub(/\t/, "")
    
    fiction = self.new(title, author)
  end 
  
  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    # category = doc.css("div.html.content-node div.html-embed-container").text.gsub(/\t/, "")
    title = doc.css("div.product-shelf-title.pr-m h3.product-info-title a").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author.contributors").text.gsub(/\t/, "")
    
    nonfiction = self.new(title, author)
  end 
  
  def self.scrape_childrens
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-childrens-picture-books/_/N-1p3p"))
    # category = doc.css("div.html.content-node div.html-embed-container").text.gsub(/\t/, "")
    title = doc.css("div.product-shelf-title.pr-m").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author.contributors").text.gsub(/\t/, "")
    
    childrens = self.new(title, author)
  end 
  
end 



