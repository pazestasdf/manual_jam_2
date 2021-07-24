class AdminController < ApplicationController
  before_action :validate_admin
  before_action :set_user, only: [:edit, :update]


  def index
    @users = User.all
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_index_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:admin)
  end
end
