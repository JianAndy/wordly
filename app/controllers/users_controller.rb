class UsersController < ApplicationController
  def index   
  end
  
  def create
    
    destroy_game_session
    @user = User.find_by(username: params["user"])
      
      if @user.nil?
        @user = User.new(username: params["user"])
        @user.save

        session[:user_id] = @user.id
        flash[:notice] = "New user created and logged in!"
        redirect_to root_path
      elsif 
        session[:user_id] = @user.id
        flash[:notice] = "Successfull login!"
        redirect_to root_path
        
      end
    
  end


  def destroy
    session[:user_id] = nil 
    destroy_game_session
    redirect_to root_path
  end

  
end
