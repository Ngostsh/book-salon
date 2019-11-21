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
      redirect_to new_user_session_path, notice: 'ログインが必要です'
    end
  end

  def create
    if params[:image].present?
      @review = Review.new(review_params)
      if @review.save
        redirect_to root_path, notice: '投稿ありがとうございます'
      else
        redirect_to root_path, notice: "投稿に失敗しました"
      end
    else
      @review = Review.new(review_params)
      @review.image = File.open("app/assets/images/default.jpg")
      if @review.save
        redirect_to root_path, notice: '投稿ありがとうございます'
      else
        redirect_to root_path, notice: "投稿に失敗しました"
      end
    end
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