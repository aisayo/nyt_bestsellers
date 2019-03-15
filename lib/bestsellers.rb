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
  
  # def self.find(id)
  #   self.all[id-1]
  # end 

  
end 

