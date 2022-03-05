class ControlController < ApplicationController
  before_action :set_user
  def index
    if params[:login_at]
      @points = Point.where(user: @user).where("created_at BETWEEN ? AND ?",params[:login_at].to_time.beginning_of_day, params[:login_at].to_time.end_of_day).order(:created_at)
    end
  end

  def register
    Point.create!(user: @user, store_id: params[:store_id])
    redirect_to root_path
  end

  private
  def set_user
    @user ||= User.find(params[:email]) if params[:email]
  end
end
