class NYT_Bestsellers::CLI 
  
  def call 
    puts "Looking for a good book? Enter 'y' for yes or 'n' for no"
    NYT_Bestsellers::Bestsellers.scrape_info
    start
    # list_bestsellers
    # list_fiction
    # list_nonfiction
    # list_childrens
    goodbye_message
  end 
  
  def start 
    input = nil
    while input != "exit"
    input = gets.strip.downcase 
    if input == 'y'
      list_categories 
    else input = 'n'
    end 
  end
  end 
  
  def list_categories
    puts "Which category would you like to see?  Fiction, nonfiction, or childrens?  Type exit at anytime to leave the program."
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
    if input == "fiction"
      list_fiction
    elsif input == "nonfiction"
        list_nonfiction
    elsif input == "childrens"
        list_childrens
    #   elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
    # selected_category = NYT_Bestsellers::Bestsellers.find_category(input)
    # puts "#{selected_category.title}"
    else
      puts "I'm sorry, I do not recognize your response."
      end 
    end
  end 
    # NYT_Bestsellers::Bestsellers.all.each.with_index(1) do |bestseller, i|
      # puts "#{i}. #{bestseller.category}"
    end 
    
    def list_fiction
      NYT_Bestsellers::Bestsellers.scrape_info
    end 
 
  
  # def list_bestsellers
  #   input = nil 
  #   while input != "exit"
  #   input = gets.strip.downcase 
  #   if input == "fiction"
  #     list_fiction
  #     elsif input == "nonfiction"
  #       list_nonfiction
  #     elsif input == "childrens"
  #       list_childrens
  #     elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
  #   selected_category = NYT_Bestsellers::Bestsellers.find_category(input)
  #   puts "#{selected_category.title}"
  #   else
  #     puts "I'm sorry, I do not recognize your response."
  #     end 
  #   end
  # end 
  
  
  # def list_nonfiction
  #   input = nil 
  #   while input != "exit"
  #   input = gets.strip.downcase 
  #   if input == "nonfiction"
  #     list_nonfiction
  #   elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
  #   selected_category = NYT_Bestsellers::Bestsellers.find_bestseller(input)
  #   puts "#{selected_category.title}"
  #   else
  #     puts "I'm sorry, I do not recognize your response."
  #     end 
  #   end
  # end 
  
  # def list_childrens
  #   input = nil 
  #   while input != "exit"
  #   input = gets.strip.downcase 
  #   if input == "childrens"
  #     list_childrens
  #   elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
  #   selected_category = NYT_Bestsellers::Bestsellers.find_bestseller(input)
  #   puts "#{selected_category.title}"
  #   else
  #     puts "I'm sorry, I do not recognize your response."
  #     end 
  #   end
  # end 
  
  # def list_bestsellers
  #   input = nil 
  #   while input != "exit"
  #   input = gets.strip.downcase 
  #   if input == "category"
  #     list_categories
  #   elsif input.to_i.between?(0, NYT_Bestsellers::Bestsellers.all.size)
  #   selected_category = NYT_Bestsellers::Bestsellers.find_bestseller(input)
  #   puts "#{selected_category.title}"
  #   else
  #     puts "I do not recognize your answer. "
  #     end 
  #   end 
  # end 
  
  def goodbye_message
    puts "Happy reading!"
  end

