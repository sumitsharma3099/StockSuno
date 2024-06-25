# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'admin'
  protected

  def after_sign_in_path_for(resource)
    admin_news_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
