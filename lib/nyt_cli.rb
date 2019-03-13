class NewYorkTimesBestsellers::CLI 
  
  def call 
    NewYorkTimesBestsellers::Scraper.new.make_bestsellers 
    puts "New York Times bestsellers"
    start 
  end 
  
  def start
  end 
  
end 