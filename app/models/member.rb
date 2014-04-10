class Member < ActiveRecord::Base
  scope :order_ct_desc, lambda { order("created_at DESC") }
  validates :name, :presence => {:message => "姓名不能为空，"},
            :length => {:minimum => 2, :maximum => 20, :message => "请填写真实姓名"}

  validates :card_id, :presence => {:message => "身份证不能为空，"},
            :uniqueness => {:message => "您所填写的身份证号以申请成功，无需再次申请！感谢您的光临！"}

  validates :email, :presence => {:message => "邮箱地址不能为空，"},
            :format => {
                :with => /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
                :multiline => true,
                :message => "请填写真实邮箱地址"
            }, :uniqueness => {:message => "您所填写的邮箱地址以申请成功，无需再次申请！感谢您的光临！"}
  validates :tel, :presence => {:message => "手机号码不能为空，"},
            :uniqueness => {:message => "您所填写的手机号码以申请成功，无需再次申请！感谢您的光临！"}

  validates_format_of :tel, :multiline => true, :message => "请填写真实手机号码", :with => /^(13[0-9]|15[0-9]|18[0-9])\d{8}$/
  validates :address, :presence => {:message => "请填写真实的家庭住址"}
  SEX_CATEGORYS = [[" 先生 ", 0], [" 女士 ", 1]]

  def Member.sex_name(category_id)
    SEX_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Member.sex_name(self.sex_id)
  end

  # 检查登录名是否存在
  def Member.check_login_exist(tel)
    accounts = Member.where(:tel => tel)
    accounts.blank? ? false : true
  end

  # 检查身份证是否存在
  def Member.check_card_exist(card_id)
    accounts = Member.where(:card_id => card_id)
    accounts.blank? ? false : true
  end
end
