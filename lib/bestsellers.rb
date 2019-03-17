require 'pry'

class NewYorkTimesBestsellers::Bestsellers 
  
  attr_accessor :title, :author, :category, :description
  
  @@all = []
  
  def initialize(title, author, category, description)
    @title = title 
    @author = author 
    @@category = category 
    @description = description
    @@all << all
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
    html = open("https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/")
    doc = Nokogiri::HTML(html)
    title = doc.css("div.page-heading").text.gsub(/\t/, "")
    author = doc.css("")
    description = doc.css("")
    category = doc.css("div.book-body").text
    
    fiction = self.new(title, author, category)
    binding.pry
  end 
  
  def self.scrape_nonfiction
    html = open("https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-nonfiction/")
    doc = Nokogiri::HTML(html)
    title = doc.css("div.page-heading").text.gsub(/\t/, "")
    author = doc.css("")
    description = doc.css("")
    category = doc.css("div.book-body").text
    
    nonfiction = self.new(title, author, category)
  end 
  
  def self.scrape_childrens
    html = open("https://www.nytimes.com/books/best-sellers/childrens-middle-grade-hardcover/")
    doc = Nokogiri::HTML(html)
    title = doc.css("div.page-heading").text.gsub(/\t/, "")
    author = doc.css("")
    description = doc.css("")
    category = doc.css("div.book-body).text
    
    childrens = self.new(title, author, category)
  end 
  
end 



