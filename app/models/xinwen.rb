class Xinwen < ActiveRecord::Base
  validates :title, :presence => {:message => "新闻标题不能为空，"}, :length => {:maximum => 25, :message => "标题长度必须小于25"}
  validates :descrpiton, :presence => {:message => "内容不能为空"}

  scope :order_ct_desc, lambda { order("created_at DESC") }

  QUESTION_CATEGORYS = [["未分类", 0], ["新校尉新闻", 9]]

  def Xinwen.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Xinwen.question_category_name(self.question_category_id)
  end

  #随机校内新闻
  def self.list_random(limit = 1)
    self.order("rand()").limit(limit)
  end
end
