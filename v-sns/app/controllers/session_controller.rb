class SessionController < ApplicationController
  def new
  end

  def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id
			redirect_to root_path 
		else
			redirect_to signin_path, :alert => "Invalid user/password combination"
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Signed out"
  end
end
