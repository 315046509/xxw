class Journalism < ActiveRecord::Base
  validates :title, :length => {:maximum => 25, :message => "标题长度必须小于25"}
  validates :descrpiton, :presence => {:message => "内容不能为空"}

  scope :order_id_desc, order("id DESC")

  QUESTION_CATEGORYS = [["未分类", 0], ["学校简介", 1], ["教师简介", 2], ["联系我们", 3], ["热点新闻", 4]]

  def Journalism.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Journalism.question_category_name(self.question_category_id)
  end

  #随机校内新闻
  def self.list_random(limit = 1)
    self.order("rand()").limit(limit)
  end
end
