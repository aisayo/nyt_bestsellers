#controller
class NYT_Bestsellers::CLI 
  
  def call 
    puts "Looking for a good book?"
    NYT_Bestsellers::Bestsellers.scrape_info
    list_categories 
    list_bestsellers
    goodbye_message
  end 
  
  def list_categories
    puts "Which category would you like to see?  Fiction, nonfiction, or children's?"
    puts "Please select another category by typing 'fiction, nonfiction, or childrens' or type 'exit' to leave"
    NYT_Bestsellers::Bestsellers.all.each.with_index(1) do |bestseller, i|
      puts "#{i}. #{bestseller.category}"
    end 
  end 
  
  def list_bestsellers
    input = nil 
    while input != "exit"
    input = gets.strip.downcase 
    if input == "category"
      list_categories 
    elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
    selected_category = NYT_Bestsellers::Bestsellers.find_bestseller(input)
    puts "#{selected_category.title}"
    else
      puts "I do not recognize your answer. "
      end 
    end 
  end 
  
  def goodbye_message
    puts "Happy reading!"
  end
end 