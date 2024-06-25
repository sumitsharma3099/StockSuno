# app/services/stock_scraper.rb
require 'nokogiri'
require 'httparty'

class StockScraper
  def self.scrape_news
    url = "https://apnews.com/"
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response.body)

    news_items = []

    doc.css('.PageList-items-item').each do |item|
      title_element = item.css('.PagePromo-title')
      description_element = item.css('.PagePromo-description')
      link_element = item.css('.PagePromo-title a').first
      image_element = item.css('img').first

      # Extract text and link values
      title = title_element.text.strip if title_element
      description = description_element.text.strip if description_element
      link = link_element['href'] if link_element
      image_link = image_element['src'] if image_element
      new_from = "AP News"  # As an example, you can adjust based on actual HTML structure

      # Check if all required fields are present
      if title.present? && description.present? && link.present? && image_link.present?
        puts "**********link*******#{link.inspect}======="
        puts "**********title*******#{title.inspect}======="
        puts "**********description*******#{description.inspect}======="
        puts "**********image_link*******#{image_link.inspect}======="

        # Collect news items
        news_items << { title: title, description: description, link: link, new_from: new_from, image_link: image_link }
      else
        puts "Skipping news item due to missing information: title: #{title.inspect}, description: #{description.inspect}, link: #{link.inspect}, image_link: #{image_link.inspect}"
      end
    end

    puts "News scraping completed."
    news_items
  end
end
