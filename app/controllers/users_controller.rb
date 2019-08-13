class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = current_user
	end

	def new
		@user = User.new
	end

	def create
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_update)
			flash[:success] = "User succesfully updated"
			redirect_to @user
			else
				render 'edit'
			end
	end

	def destroy
	end

	private
	def user_update
		params.require(:user).permit(:first_name, :last_name, :description, user: current_user)
	end

end
