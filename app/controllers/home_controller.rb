class HomeController < ApplicationController
    before_action :authenticate_user!

  def index
   if current_user.manager?
    redirect_to projects_path
  elsif current_user.qa?
    redirect_to projects_path
  elsif current_user.developer?
    redirect_to projects_path
  else
    redirect_to 'home#index'
      
  end
  end
end
