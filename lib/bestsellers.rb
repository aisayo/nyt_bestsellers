class Bestsellers 
  
  attr_accessor :title, :author, :genre, :description, :url
  
  @@all = []
  
  def initialize(title=nil, author=nil, url=nil)
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
  
  # def self.find(id)
  #   self.all[id-1]
  # end 
  
  def fiction
    @fiction ||= doc.css("")
  end 
  
  def nonfiction
    @nonfiction ||= doc.css("")
  end 
  
  def childrens
    @childrens ||= doc.css("")
  end 
  
end 

