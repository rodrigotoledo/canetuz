class Api::ControlController < ApplicationController
  before_action :set_user

  def login
    point = Point.where(user: @user, store_id: params[:store_id]).where("created_at BETWEEN ? AND ?",Time.now.beginning_of_day, Time.now.end_of_day).first

    unless point
      point = Point.create!(user: @user, store_id: params[:store_id], latitude: params[:latitude], longitude: params[:longitude])
    end
    render json: point
  end

  def logout
    point = Point.where(user: @user, store_id: params[:store_id]).where("created_at BETWEEN ? AND ?",Time.now.beginning_of_day, Time.now.end_of_day).first

    unless point
      point = Point.create!(user: @user, store_id: params[:store_id], latitude: params[:latitude], longitude: params[:longitude])
    else
      point.touch
    end
    render json: point
  end

  def index
  end

  def users
    render json: User.all
  end

  private
  def set_user
    @user ||= User.find_by(email: params[:email])
  end

end
