# app/controllers/admin/news_controller.rb

class Admin::NewsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin! # Ensure only authenticated admins can access
    before_action :set_news_article, only: [:edit, :update, :destroy, :show]
  
    # GET /admin/news
    def index
      @news_articles = News.all.order(created_at: :desc)
    end
  
    # GET /admin/news/new
    def new
      @news_article = News.new
    end
  
    # POST /admin/news
    def create
      @news_article = News.new(news_params)
  
      if @news_article.save
        redirect_to admin_news_index_path, notice: 'News article was successfully created.'
      else
        render :new
      end
    end
  
    # GET /admin/news/:id/edit
    def edit
    end
  
    # PATCH /admin/news/:id
    def update
      if @news_article.update(news_params)
        redirect_to admin_news_index_path, notice: 'News article was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /admin/news/:id
    def destroy
      @news_article.destroy
      redirect_to admin_news_index_path, notice: 'News article was successfully deleted.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = News.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :description, :link, :new_from, :image_link)
    end
  end
  