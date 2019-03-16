class Bestsellers 
  
  attr_accessor :title, :author, :genre, :description, :url
  
  @@all = []
  
  def initialize(title=nil, author=nil, url=nil)
    @title = title 
    @author = author 
    @genre = genre 
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
  
end 

