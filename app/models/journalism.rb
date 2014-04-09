class Journalism < ActiveRecord::Base
  validates :title, :length => {:maximum => 25, :message => "标题长度必须小于25"}
  validates :descrpiton, :presence => {:message => "内容不能为空"}

  scope :order_id_desc, order("id DESC")

  QUESTION_CATEGORYS = [["未分类", 0], ["全景校区", 1], ["校内活动", 3], ["历年成绩", 4], ["学校文化", 5], ["教师风采", 6], ["分校查询", 7], ["联系我们", 8]]

  def Journalism.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Journalism.question_category_name(self.question_category_id)
  end
end
