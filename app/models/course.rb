class Course < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写标题"}, :length => {:maximum => 25, :message => "标题必须小于25个字"}
  validates :descrpiton, :presence => {:message => "请填写内容"}

  scope :order_id_desc, order("id DESC")
  scope :order_ct_desc, order("created_at DESC")

  QUESTION_CATEGORYS = [["未分类", 0], ["美术高考基础班", 1], ["高考美术集训课程", 2], ["初中高中一对一个性化辅导", 3], ["艺术类考生高考文化课冲刺班", 4]]

  def Course.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Course.question_category_name(self.question_category_id)
  end
end
