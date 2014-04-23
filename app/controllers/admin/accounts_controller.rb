class Admin::AccountsController < Admin::MainController
  layout 'admin'
  #用户管理/用户列表
  def index
    @accounts = Member.order_ct_desc
    @accounts = @accounts.where("id = ?", params[:member_id]) unless params[:member_id].blank?
    @accounts = @accounts.where("name like ?", "%#{params[:name]}%") unless params[:name].blank?
    @accounts = @accounts.where("tel like ?", "%#{params[:tel]}%") unless params[:tel].blank?
    @accounts = @accounts.where("email like ?", "%#{params[:email]}%") unless params[:email].blank?
    @accounts = @accounts.where("sex_id like ?", "%#{params[:sex_id]}%") unless params[:sex_id].blank?
    @accounts = @accounts.where("address like ?", "%#{params[:address]}%") unless params[:address].blank?
    @accounts = @accounts.page(params[:page]).per(20)
  end

  #   删除
  def destroy
    @journalism = Member.find(params[:id])
    flash[:error_msg] = @journalism.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_accounts_path and return
  end
end
