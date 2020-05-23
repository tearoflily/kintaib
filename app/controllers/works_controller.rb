class WorksController < ApplicationController
  before_action :set_one_month, only:[:index, :edit, :update]
  
  
  def index
    @user = User.find(params[:user_id])
    @worked_sum = @user.attendances.where.not(started_at: nil).count
    @attendance_update ||= Attendance.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @attendance_save = @user.attendances.find_by(worked_on: Date.current)
    if @attendance_save.started_at.nil?
      if @attendance_save.update_attributes(user_id:params[:user_id], worked_on: Date.current, started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます"
        redirect_to user_works_path @user
      else
        flash[:danger] = "出勤開始 登録に失敗しました。やり直してください。"
        render :index
      end
    elsif @attendance_save.finished_at.nil?
      if @attendance_save.update_attributes(user_id:params[:user_id], finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした"
        redirect_to user_works_path @user
      else
        flash[:danger] = "退勤 登録に失敗しました。やり直してください。"
        render :index
      end
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    
  end
  
  def edit
    @user = User.find(params[:user_id])
    @first_day = params[:id].to_date
    @attendance_update ||= Attendance.new
  end
  
  def update
  begin
    @attendances ||= Attendance.new
    ActiveRecord::Base.transaction do
      
      attendances_params.each do |id, item|
        @attendance_update = Attendance.find(id)
        
        @attendance_update.update_attributes!(item)
      end
    end
    flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
    redirect_to edit_user_work_path(@user.id) and return
  rescue ActiveRecord::RecordInvalid
    
    flash.now[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    render :edit
  end
  end
  
  
  private
  
    def attendances_params
      params.require(:user).permit(attendances: [:started_at, :finished_at, :note])[:attendances]
    end
  
end