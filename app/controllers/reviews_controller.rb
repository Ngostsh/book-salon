class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to root_path, alert: 'レビューを入力してください'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to root_url, notice: 'レビューを削除しました'
    else
      redirect_to root_url, alert: 'レビューの削除に失敗しました'
    end
  end

  private

  def review_params
    params.permit(:rate, :review, :book_id).merge(user_id: current_user.id)
  end

end