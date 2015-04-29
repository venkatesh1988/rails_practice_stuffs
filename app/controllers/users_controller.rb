class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:destroy,:update]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  	@user.address.build
  end

  def create
  	@user = User.create user_params
  	if @user.save
  		flash[:notice] = "User details saved!"
  		redirect_to users_path
  	else
  		redirect_to new_user_path
  	end
  end

  def edit
  end

  def destroy
  	if @user.destroy
  		flash[:notice] = "User Deleted"
  		redirect_to users_path
  	else
  		flash[:notice] = "The user cannot be deleted"
  		redirect_to new_user_path
  	end
  end

  def update
  	if @user.update user_params
  		flash[:notice] = "User details updated"
  		redirect_to users_path
  	else
  		redirect_to new_user_path
  	end

  end

  private 
  def user_params
  	params.require(:user).permit(:name,:email,address_attributes:[:id,:primary_address,:secondary_address])
  end

  def set_user
  	@user = User.find params[:id]
  end
end
