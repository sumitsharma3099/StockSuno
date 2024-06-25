class StaticPagesController < ApplicationController
  def about
    @about_us = About.first
  end
  def faq
    @faqs = Faq.all
  end
  def contact
  end
end
