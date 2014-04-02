class Admin::MainController < Admin::AdminController
  layout 'admin_no_sider'

  # 管理员登录
  def login;end

  # 验证登录
  def check_login
    login_name = params[:login_name]
    password = params[:password]
    if (login_name == "admin" && password == "admin")
      #登录成功
      do_admin_login("")
      redirect_to admin_accounts_path
    else
      flash[:notice] = "您的用户名或者密码不正确，请重新输入！"
      redirect_to "/admin/login"
    end
  end
  
  # 退出
  def logout
    session[:admin_id] = nil
    flash[:notice] = "已成功退出"
    redirect_to admin_login_path
  end

  def do_admin_login(admin_account)
    session[:admin_id] = 1
  end
end
