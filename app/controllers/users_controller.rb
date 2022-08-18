class UsersController < ApplicationController
  def index    
  end
  
  def create

    if params["user"].blank?
      flash[:notice] = "Login can't be empty"
      redirect_to users_path
    elsif 
      @user = User.find_by(username: params["user"])
    
      if @user
       session[:user_id] = @user.id
       flash[:notice] = "Successfull login!"
       redirect_to root_path
   
      elsif 
   
         @user = User.new(username: params["user"])
       
         @user.save
         session[:user_id] = @user.id
         flash[:notice] = "New user created and logged in!"
         redirect_to root_path
   
         
       end
    
    end


  end

  def destroy
    session[:user_id] = nil 
    destroy_game_session
    redirect_to root_path
  end

  
end
