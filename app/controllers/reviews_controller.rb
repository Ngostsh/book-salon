class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
  end

  def create
    Review.create(review_params)
  end

  private
  def review_params
    params.permit(:name, :image, :text)
  end

end