class SchoolNewsController < ApplicationController
  def index
    # 全部新闻
    @category_9_name = Xinwen.question_category_name(9)
    @category_9_questions = Xinwen.where({:question_category_id => 9}, "title <> ''").order_ct_desc.page(params[:page]).per(10)
  end

  def show
    # 新闻
    @journalism = Xinwen.find params[:id]
  end
end
