class UsersController < ActionController::Base

	def index
		@users = User.all
	end

	def show
		@users = User.all
	end
 
	def edit
		@user = User.find(session[:id])
	end

	def update
		@user.update(userparams)
		redirect_to :back
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(userparams)
		if @user.save
			flash[:notice] = "Account successfully created!"
			redirect_to users_path
		else
			flash[:alert] = "User was not created successfully."
			redirect_to users_path
		end

			
	end


	def destroy
		if session[:id] == @user.id
			session[:id] = nil
			@user = User.find(params[:id]).destroy
			redirect_to users_path, notice: "User deleted!"
		else
			redirect_to users_path, notice: "User was not deleted."
		end
	end

	private

	def userparams
		params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname, :phone)
	end	


	def set_user
		@user = User.find(params[:id])
	end
end