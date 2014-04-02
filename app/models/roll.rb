class Roll < ActiveRecord::Base
  validates :url, :presence => {:message => "链接为空！"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:medium => "213x160#", :thumb => "85x60#"}, :default_url => "/images/:style/missing.png",
                    :url => "/roll/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']
end
