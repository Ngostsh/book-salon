class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy, :edit, :update]
  before_action :correct_referer, only: [:new, :show, :destroy, :edit, :update]
  before_action :user_login_check, only: [:new, :create, :destroy, :edit, :update]

  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(8)
  end

  def show
    @user = @review.user
  end

  def new
  end

  def create
    if params[:image].present?
      @review = Review.new(review_params)
      if @review.save
        redirect_to root_url, notice: '投稿ありがとうございます'
      else
        flash.now[:notice] = "投稿に失敗しました"
        render action: :new
      end
    else
      @review = Review.new(review_params)
      @review.image = File.open("app/assets/images/default.jpg")
      if @review.save
        redirect_to root_url, notice: '投稿ありがとうございます'
      else
        flash.now[:notice] = "投稿に失敗しました"
        render action: :new
      end
    end
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to root_url, notice: '書評を削除しました'
    else
      redirect_to root_url, alert: '書評の削除に失敗しました'
    end
  end

  def edit
    if @review.user_id != current_user.id
      redirect_to root_url, alert: '投稿ユーザーではないため、編集できません'
    end
  end

  def update
    if @review.user_id == current_user.id
      @review.update(review_update_params)
      redirect_to root_url, notice: '書評を更新しました'
    else
      redirect_to root_url, alert: '投稿ユーザーではないため、書評の更新に失敗しました'
    end
  end
  
  def search
    @reviews = Review.where("LOWER(name) LIKE ?", "%#{params[:keyword].downcase}%").page(params[:page]).limit(20)
  end
  
  private

  def review_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def review_update_params
    params.require(:review).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
  
  def set_review
    if Review.where(id: params[:id]).present?
      @review = Review.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def correct_referer
    if request.referer.nil?
      redirect_to root_url
    end
  end

  def user_login_check
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'ログインが必要です'
    end
  end

end