class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]

  before_action :admin_user, only: [:destroy, :index, :edit_work]
  before_action :admin_or_correct_user, only: [:show, :edit, :update]
  
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
    if params[:search]
      @title_search = "検索結果"
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規登録に成功しました'
      redirect_to @user
    else
      flash[:danger] = '新規登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
   
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to @user
    else
      render :index
    end
  end
  
  def edit_work
    @user = User.find(params[:id])
  end
  

    

    
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :department, :basic_time, :work_time, :password, :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def admin_or_correct_user
      @user = User.find(params[:id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end
    end
  

end
