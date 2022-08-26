class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = user.find(param[:id])
	end

  def create
    @user = User.create(user_params)

    if@user.save
      redirect to root_parh
    else
      flash[:alert] = 'Please try again'
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password_digest)
  end
end
