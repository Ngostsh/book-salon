class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id).page(params[:page]).per(16).order("created_at DESC")
  end
end
