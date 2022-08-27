class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = user.find(param[:id])
	end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect to root_parh
    else
      flash[:alert] = 'Please try again'
    end
  end

  private

  def user_params
    params.require(:users).permit(:linx, :first_name, :last_name, :email, :password_digest, :gender, :birthdate)
  end
end
