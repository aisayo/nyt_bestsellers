#controller
class NYT_bestsellers::CLI 
  
  def call 
    puts "Looking for a good book?"
    NytBestsellers::bestsellers.scrape_info
    list_categories 
    list_bestsellers
    goodbye_message
  end 
  
  def list_categories
    puts "Which category would you like to see?  Fiction, nonfiction, or children's?"
    puts "Please select another category by typing 'category' or type 'exit' to leave"
    NytBestsellers::bestsellers.all.each.with_index(1) do |bestseller, i|
      puts "#{i}. #{bestseller.category}"
    end 
  end 
  
  def list_bestsellers
    input = nil 
    while input != "exit"
    input = gets.strip.downcase 
    if input == "category"
      list_categories 
    elsif input.to_i.between?(0, NytBestsellers::bestsellers.all.size)
    selected_category = NytBestsellers::bestsellers.find_bestsellers(input)
    puts "#{selected_category.title}"
    else
      puts "I do not recognize your answer. "
    end 
  end 
  
  def goodbye_message
    puts "Happy reading!"
  end
  
end 