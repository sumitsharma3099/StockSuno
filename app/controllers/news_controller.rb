class NewsController < ApplicationController
  def index
    @news_items = News.all.order(created_at: :desc)
  end
end
