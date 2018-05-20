# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

    #ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def time
    params[:year] ||= Time.now.year
    params[:month] ||= Time.now.month
  end

end
