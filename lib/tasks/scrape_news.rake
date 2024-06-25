# lib/tasks/scrape_news.rake
namespace :scrape do
  desc 'Scrape news from AP News'
  task news: :environment do
    begin
      # Ensure StockScraper is autoloaded by Rails
      require_dependency Rails.root.join('app/services/stock_scraper.rb')
      
      news_items = StockScraper.scrape_news

      if news_items.nil? || news_items.empty?
        puts "No news items found."
      else
        news_items.each do |news|
          puts "**********link*******#{news[:link].inspect}======="
          puts "**********title*******#{news[:title].inspect}======="
          puts "**********description*******#{news[:description].inspect}======="

          # Check if news already exists based on the link, otherwise create new
          existing_news = News.find_or_initialize_by(link: news[:link])

          if existing_news.new_record? || existing_news.title != news[:title] || existing_news.description != news[:description]
            existing_news.update(
              title: news[:title],
              description: news[:description],
              new_from: news[:new_from],
              image_link: news[:image_link]
            )
            puts "Saved news item: #{news[:title]}"
          else
            puts "Skipped duplicate news item: #{news[:title]}"
          end
        end
      end

      puts "News scraping completed."
    rescue StandardError => e
      puts "Error while scraping news: #{e.message}"
      puts e.backtrace.join("\n")
    end
  end
end
