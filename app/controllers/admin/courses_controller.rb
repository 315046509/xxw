class Admin::CoursesController < ApplicationController
  layout 'admin'

  def index
    @journalisms = Course.order_id_desc.page(params[:page]).per(10)
  end

  def new
    @journalism = Course.new
  end

  def create
    @journalism = Course.new(
        :title => params[:course][:title],
        :descrpiton => params[:course][:descrpiton],
        :question_category_id => params[:course][:question_category_id]
    )
    if @journalism.save
      flash[:note] = "创建成功"
      redirect_to admin_courses_path and return
    else
      flash[:error_msg] = @journalism.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def edit
    @journalism = Course.find(params[:id])
  end

  def update
    @category = Course.find(params[:id])
    update_category = @category.update_attributes(
        :title => params[:course][:title],
        :descrpiton => params[:course][:descrpiton],
        :question_category_id => params[:course][:question_category_id]
    )
    if update_category
      respond_to do |category|
        category.html {
          redirect_to admin_courses_path and return
        }
      end
    end
  end

  def show
    @journalism = Course.find params[:id]
  end

  #   删除
  def destroy
    @journalism = Course.find(params[:id])
    flash[:error_msg] = @journalism.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_courses_path and return
  end
end
