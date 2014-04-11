class SchoolActivitiesController < ApplicationController
  def index
    # 新校尉活动
    @category_2_name = Journalism.question_category_name(3)
    @category_2_questions = Journalism.where({:question_category_id => 3}, "title <> ''").page(params[:page]).per(10)
  end

  def show
    # 新校尉活动
    @journalism = Journalism.find params[:id]
  end
end
