class CoursesController < ApplicationController
  def index
    # 课程安排
    @category_2_questions = Course.where("title <> ''").order_ct_desc.page(params[:page]).per(10)
  end

  def show
    # 课程安排
    @journalism = Course.find params[:id]
  end
end
