class Journalism < ActiveRecord::Base
  validates :title, :presence => {:message => "标题不能为空"}
  validates :descrpiton, :presence => {:message => "内容不能为空"}

  scope :ct_desc, order("created_at DESC")

  QUESTION_CATEGORYS = [["未分类", 0], ["学校简介", 1], ["教师简介", 2], ["联系我们", 3]]

  def Journalism.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Journalism.question_category_name(self.question_category_id)
  end
end
