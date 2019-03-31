class NYT_Bestsellers::CLI 
  
  def call 
    puts "Looking for a good book? Enter 'y' for yes or 'n' for no"
    NYT_Bestsellers::Bestsellers.scrape_info
    start
    list_categories
    list_bestsellers
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
   NYT_Bestsellers::Bestsellers.all do |bestseller|
      puts "#{bestseller.title}"
      puts "#{bestseller.author}"
    end
    end
  end 
  
  def list_bestsellers
    input = nil 
    while input != "exit"
    input = gets.strip.downcase 
    if input == "fiction"
      list_fiction
      elsif input == "nonfiction"
        list_nonfiction
      elsif input == "childrens"
        list_childrens
      else
      puts "I'm sorry, I do not recognize your response."
      end 
    end
  end 
  
  def list_fiction
    scrape_fiction
    puts "title: #{@scrape_fiction.title}"
    puts "author: #{@scrape_fiction.author}"
  end 
   
  def list_fiction
    # puts "#{title} - #{author}"
    puts "fiction: #{@scrape_fiction}"
    puts "author: #{@scrape_fiction.author}"
  end
  
  def list_nonfiction
    # puts "#{title} - #{author}"
    puts "nonfiction: #{@scrape_nonfiction}"
    # puts "author: #{@scrape_fiction.author}"
  end
  
  def list_childrens
    # puts "#{title} - #{author}"
    puts "childrens: #{@scrape_childrens}"
    # puts "author: #{@scrape_fiction.author}"
  end
  
  def goodbye_message
    puts "Happy reading!"
  end
end 

