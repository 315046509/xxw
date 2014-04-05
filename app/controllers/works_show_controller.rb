class WorksShowController < ApplicationController
  def index
    @category_3_name = Roll.question_category_name(3)
    @category_3_questions = Roll.where({:question_category_id => 3})
  end
end
