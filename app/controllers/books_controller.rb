class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy, :edit, :update]
  before_action :correct_referer, only: [:new, :show, :destroy, :edit, :update]
  before_action :user_login_check, only: [:new, :create, :destroy, :edit, :update]

  def index
    @books = Book.order("created_at DESC").page(params[:page]).per(8)
  end

  def show
    @user = @book.user
    @reviews = @book.reviews.includes(:user)
  end

  def new
  end

  def create
    if params[:image].present?
      @book = Book.new(book_params)
      if @book.save
        redirect_to root_url, notice: '登録ありがとうございます'
      else
        flash.now[:notice] = "登録に失敗しました"
        render action: :new
      end
    else
      @book = Book.new(review_params)
      @book.image = File.open("app/assets/images/default.jpg")
      if @book.save
        redirect_to root_url, notice: '登録ありがとうございます'
      else
        flash.now[:notice] = "登録に失敗しました"
        render action: :new
      end
    end
  end

  def destroy
    if @book.user_id == current_user.id
      @book.destroy
      redirect_to root_url, notice: '本を削除しました'
    else
      redirect_to root_url, alert: '本の削除に失敗しました'
    end
  end

  def edit
    if @book.user_id != current_user.id
      redirect_to root_url, alert: '投稿ユーザーではないため、編集できません'
    end
  end

  def update
    if @book.user_id == current_user.id
      @book.update(book_update_params)
      redirect_to root_url, notice: '本の情報を更新しました'
    else
      redirect_to root_url, alert: '投稿ユーザーではないため、本の情報に失敗しました'
    end
  end
  
  def search
    @books = Book.where("LOWER(name) LIKE ?", "%#{params[:keyword].downcase}%").page(params[:page]).limit(20)
  end
  
  private

  def book_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def book_update_params
    params.require(:book).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
  
  def set_book
    if Book.where(id: params[:id]).present?
      @book = Book.find(params[:id])
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