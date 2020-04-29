class WorksController < ApplicationController
  before_action :set_one_month, only: :index
  
  
  def index
    @user = User.find(params[:user_id])


  end
  
  def show
    @user = User.find(params[:user_id])
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます"
      else
        flash[:danger] = "出勤開始 登録に失敗しました。やり直してください。"
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした"
      else
        flash[:danger] = "退勤 登録に失敗しました。やり直してください。"
      end
    end
    redirect_to user_works_path
  end
  
  
  
end
