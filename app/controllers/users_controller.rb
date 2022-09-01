class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = user.find(param[:id])
	end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User created successfully'
      session[:user_id] = @user.id
      session[:first_name] = @user.first_name
      redirect to login_path
    else
      flash[:error] = 'Please try again'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:linx, :first_name, :last_name, :email, :password_digest, :gender, :birthdate)
  end
end
