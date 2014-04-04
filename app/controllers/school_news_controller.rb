class SchoolNewsController < ApplicationController
  def index
    # 全部新闻
    @category_4_name = Journalism.question_category_name(4)
    @category_4_questions = Journalism.where({:question_category_id => 4}, "title <> ''").page(params[:page]).per(10)
  end

  def show
    # 新闻
    @journalism = Journalism.find params[:id]
  end
end
