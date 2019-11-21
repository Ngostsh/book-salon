class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(8)
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def new
    if user_signed_in?
    else
      redirect_to new_user_session_path, notice: 'ログインして下さい'
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
      redirect_to root_path, alert: 'ユーザーでないため、書評の削除に失敗しました。'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.update(review_update_params)
      redirect_to root_path, notice: '書評を更新しました'
    else
      redirect_to root_path, alert: 'ユーザーでないため、書評の更新に失敗しました。'
    end
  end

  private
  def review_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  private
  def review_update_params
    params.require(:review).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end