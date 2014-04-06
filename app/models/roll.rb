class Roll < ActiveRecord::Base
  validates :url, :presence => {:message => "链接为空！"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:medium => "220x160#", :thumb => "68x48#", :thumb1 => "342x200#", :zuopin => "640x480#"}, :default_url => "/images/:style/missing.png",
                    :url => "/roll/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']

  @filepath="public/roll/"
  @previewpath = "previews/"

  # 分类
  QUESTION_CATEGORYS = [["未分类", 0], ["幻灯片", 1], ["轮转", 2], ["作品展示", 3]]

  def Roll.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Roll.question_category_name(self.question_category_id)
  end

  # 删除图片
  def self.deletefile(r_id)
    idstr = format("%09d", r_id.to_s)
    one_path = @filepath+idstr[0, 3]+"/"
    two_path = one_path + idstr[3, 3]+"/"
    three_path = two_path + idstr[6, 3]+"/"
    begin
      `rm -rf #{Rails.root+three_path}`
    rescue
      if system "rm -rf #{Rails.root+three_path}"
        return true
      else
        return false
      end
    end
    return true
  end

  #错误提示
  def Roll.message
    @message
  end
end
