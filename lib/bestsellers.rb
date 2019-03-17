require 'pry'

class NewYorkTimesBestsellers::Bestsellers 
  
  attr_accessor :title, :author, :category, :description
  
  @@all = []
  
  def initialize(title, author, category, description)
    @title = title 
    @author = author 
    @category = category 
    @description = description
    @@all << all
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  # def self.find_bestseller(i)
  #   self.all[i.to_i - 1]
  # end 
  
  def self.find(id)
    self.all[id-1]
  end 
  
  def self.scrape_info
    bestsellers = []
    
    bestsellers << self.scrape_fiction
    bestsellers << self.scrape_nonfiction
    bestsellers << self.scrape_childrens
  end 
  
  def self.scrape_fiction
    html = open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-fiction/_/N-1p3r")
    doc = Nokogiri::HTML(html)
    category = doc.css("div.html content-node.html-embed-container").text.gsub(/\t/, "")
    title = doc.css("<div.product-shelf-title pr-m").text.gsub(/\t/, "")
    author = doc.css("div.product-shelf-author contributors").text.gsub(/\t/, "")
    description = doc.css("div.text--medium overview-content").text.gsub(/\t/, "")
    
    fiction = self.new(category, title, author)
  end 
  
  def self.scrape_nonfiction
    html = open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q")
    doc = Nokogiri::HTML(html)
    category = doc.css("").text.gsub(/\t/, "")
    title = doc.css("").text.gsub(/\t/, "")
    author = doc.css("").text.gsub(/\t/, "")
    description = doc.css("").text.gsub(/\t/, "")
    
    nonfiction = self.new(category, title, author)
  end 
  
  def self.scrape_childrens
    html = open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers-childrens-picture-books/_/N-1p3p")
    doc = Nokogiri::HTML(html)
    category = doc.css("").text.gsub(/\t/, "")
    title = doc.css("").text.gsub(/\t/, "")
    author = doc.css("").text.gsub(/\t/, "")
    description = doc.css("").text.gsub(/\t/, "")
    
    childrens = self.new(category, title, author)
  end 
  
end 



