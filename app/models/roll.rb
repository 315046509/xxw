class Roll < ActiveRecord::Base
  validates :url, :presence => {:message => "链接为空！"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:medium => "213x160#", :thumb => "85x60#", :thumb1 => "342x300#"}, :default_url => "/images/:style/missing.png",
                    :url => "/roll/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']


  QUESTION_CATEGORYS = [["未分类", 0], ["幻灯片", 1], ["轮转", 2]]

  def Roll.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Roll.question_category_name(self.question_category_id)
  end
end
