class Admin::JournalismsController < ApplicationController
  layout 'admin'

  def index
    @journalisms = Journalism.order_id_desc.page(params[:page]).per(20)
  end

  def new
    @journalism = Journalism.new
  end

  def create
    @journalism = Journalism.new(
        :title => params[:journalism][:title],
        :descrpiton => params[:journalism][:descrpiton],
        :question_category_id => params[:journalism][:question_category_id]
    )
    if @journalism.save
      flash[:note] = "创建成功"
      redirect_to admin_journalisms_path and return
    else
      flash[:error_msg] = @journalism.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def show
    @journalism = Journalism.find params[:id]
  end

  #   删除
  def destroy
    @journalism = Journalism.find(params[:id])
    flash[:error_msg] = @journalism.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_journalisms_path and return
  end
end
