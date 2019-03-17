#prompt user 
#choose from genre: fiction, nonfiction, children's 
#return list for selected genre 
#return info for book selected from list 

class NYT_bestsellers::CLI 
  
  def call 
    puts "Looking for a good book?"
    NYT_bestsellers::bestsellers.scrape_info
    list_categories 
    list_bestsellers
    goodbye
  end 
  
  def list_categories
    puts "Which genre would you like to see?  Fiction, nonfiction, or children's?"
    NYT_bestsellers::bestsellers.all.each.with_index(1) do |bestseller, i|
      puts "#{i}. #{bestseller.category}"
      puts "Would you like to see another genre?  Enter Y or N"
    end 
  end 
    
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
  
  def list_bestsellers
  end 
  
end 