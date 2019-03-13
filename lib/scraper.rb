class NewYorkTimesBestsellers::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end 
  
  def scrape_bestsellers_index
    self.get_page.css()
  end 