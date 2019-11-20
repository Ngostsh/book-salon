class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def new
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def create
    Review.create(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to root_path, notice: '書評を削除しました'
    else
      redirect_to root_path, alert: 'ログインユーザーでないため、書評の削除に失敗しました。'
    end
  end

  private
  def review_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end