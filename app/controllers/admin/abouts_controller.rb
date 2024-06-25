# app/controllers/admin/about_controller.rb

class Admin::AboutsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin! # Ensure only authenticated admins can access
    before_action :set_about, only: [:edit, :update, :index]

    def index
    end
    # GET /admin/about/edit
    def edit
    end
  
    # PATCH /admin/about
    def update
      if @about.update(about_params)
        redirect_to admin_about_edit_path, notice: 'About Us content was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.first_or_initialize # Adjust this according to your actual model setup
    end
  
    # Only allow a list of trusted parameters through.
    def about_params
      params.require(:about).permit(:content) # Adjust this based on your About model attributes
    end
  end
  