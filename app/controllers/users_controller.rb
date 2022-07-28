class UsersController < ApplicationController
  def index    
  end
  
  def create
    session[:user_id] = params["user"]
    flash[:notice] = "Successfull login!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path
  end
end
