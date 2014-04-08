class SchoolNewsController < ApplicationController
  def index
    # 全部新闻
    @category_9_name = Journalism.question_category_name(9)
    @category_9_questions = Journalism.where({:question_category_id => 9}, "title <> ''").page(params[:page]).per(10)
  end

  def show
    # 新闻
    @journalism = Journalism.find params[:id]
  end
end
