class PagesController < ApplicationController
  impressionist :actions=>[:show]
  before_action :authenticate_user!, only: [:dashboard]
  
  def index
    if user_signed_in?
      redirect_to dashboard_path
    end

    @products = Product.last(12)
  end

  def dashboard
    @products = Product.all
    @categories = Category.all
  end
end
