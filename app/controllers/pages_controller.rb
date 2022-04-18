class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  
  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
  end
end
