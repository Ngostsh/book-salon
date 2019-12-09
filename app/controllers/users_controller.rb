class UsersController < ApplicationController
  before_action :correct_referer, only: [:show]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).per(16).order("created_at DESC")
    @books = Book.where(user_id: @user.id).page(params[:page]).per(16).order("created_at DESC")
  end

  def show_reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).per(16).order("created_at DESC")
  end

  private

  def correct_referer
    if request.referer.nil?
      redirect_to root_path, alert: 'url直打ちはご遠慮下さい'
    end
  end

end
