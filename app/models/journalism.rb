class Journalism < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写标题"}, :length => {:maximum => 25, :message => "标题必须小于25个字"}
  validates :descrpiton, :presence => {:message => "请填写内容"}

  scope :order_id_desc, order("id DESC")
  scope :order_ct_desc, order("created_at DESC")

  QUESTION_CATEGORYS = [["未分类", 0], ["新校尉全景", 1], ["新校尉活动", 3], ["新校尉文化", 5], ["新校尉团队", 6], ["地址查询", 7], ["联系我们", 8]]

  def Journalism.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Journalism.question_category_name(self.question_category_id)
  end
end
