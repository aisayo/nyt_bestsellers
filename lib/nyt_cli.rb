#prompt user 
#choose from genre: fiction, nonfiction, children's 
#return list for selected genre 
#return info for book selected from list 

class NewYorkTimesBestsellers::CLI 
  
  def call 
    puts "Looking for a good book?"
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