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
    puts "Please select another category by typing 'category' or type 'exit' to leave"
    NYT_bestsellers::bestsellers.all.each.with_index(1) do |bestseller, i|
      puts "#{i}. #{bestseller.category}"
    end 
  end 
  
  def list_bestsellers
    input = nil 
    while input != "exit"
    input = gets.strip.downcase 
    if input == "category"
      list_categories 
    elsif input.to_i.between?(0, NYT_bestsellers::bestsellers.all.size)
    selected_category = NYT_bestsellers::bestsellers.find_rbestsellers(input)
    puts "#{selected_category.title}"
    else
      puts "I do not recognize your answer. "
  end 
  
  def goodbye
    puts "Happy reading!"
  end
  
end 