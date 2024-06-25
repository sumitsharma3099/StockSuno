# app/controllers/admin/faqs_controller.rb

class Admin::FaqsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!   # Ensure user is authenticated
  
    def index
      @faqs = Faq.all
    end
  
    def show
      @faq = Faq.find(params[:id])
    end
  
    def new
      @faq = Faq.new
    end
  
    def create
      @faq = Faq.new(faq_params)
      if @faq.save
        redirect_to admin_faq_path(@faq), notice: 'FAQ was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @faq = Faq.find(params[:id])
    end
  
    def update
      @faq = Faq.find(params[:id])
      if @faq.update(faq_params)
        redirect_to admin_faq_path(@faq), notice: 'FAQ was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @faq = Faq.find(params[:id])
      @faq.destroy
      redirect_to admin_faqs_path, notice: 'FAQ was successfully deleted.'
    end
  
    private
  
    def faq_params
      params.require(:faq).permit(:question, :answer)
    end

  end
  