class Admin::AdminController < ApplicationController
before_filter :admin_login_filter,:except => [:login, :check_login]
before_filter :admin_logined_filter,:only => [:login]

def browser_filter
  if !(request.headers["User-Agent"].include?("Chromium") || request.headers['User-Agent'].include?("Chrome") ||
      request.headers['User-Agent'].include?("Firefox"))
    redirect_to "/" 
  end
end
  # 未登录过滤
  def admin_login_filter
    if session[:admin_id].nil?
      redirect_to "/admin/login" and return
    end
  end

  # 已登录过滤
  def admin_logined_filter
    if session[:admin_id]
      redirect_to "/admin/" and return
    end
  end
end
