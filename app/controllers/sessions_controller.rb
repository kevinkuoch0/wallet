class SessionsController < ActionController::Base

	def login
		@user = User.find_by(email: params[:email])
		if @user and @user.password == params[:password]
			session[:id] = @user.id
		redirect_to users_path, [:notice] = "Successfully logged in!"
		else
			redirect_to root_path 
			flash[:notice] = "Incorrect login information."
		end
	end	

	def logout
		session[:id] = nil
		flash[:notice] = "You have logged out successfully!"
		redirect_to root_path
	end

end