class NewYorkTimesBestsellers::CLI 
  
  def call 
    NewYorkTimesBestsellers::Scraper.new.make_bestsellers 
    puts "New York Times bestsellers top 5 this week"
    start 
  end 
  
  def start
    puts ""
    puts "Which genre would you like to see?  Fiction, nonfiction, or children's?"
    input = gets.strip.to_i
    
    print_bestsellers(input)
    
    puts ""
    puts "Would you like to see another genre?  Enter Y or N"
    
    input = gets.strip.downcase
    if input == "y"
      start 
    elseif input == "n"
      puts ""
      puts "Happy reading!"
      exit 
    else 
      puts ""
      puts "I don't recognize your answer."
      start 
    end 
  end 
  
end 