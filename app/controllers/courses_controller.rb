class CoursesController < ApplicationController
  def index
    @category_2_questions = Course.where("title <> ''").order_ct_desc.page(params[:page]).per(10)
  end

  def show
    @journalism = Course.find params[:id]
  end
end
