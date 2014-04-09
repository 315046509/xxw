class MainController < ApplicationController
  def index
    @category_1_name = Roll.question_category_name(1)
    @category_1_questions = Roll.where({:question_category_id => 1})
    @category_2_name = Roll.question_category_name(2)
    @category_2_questions = Roll.where({:question_category_id => 2})
    @category_9_name = Xinwen.question_category_name(9)
    @category_9_questions = Xinwen.where({:question_category_id => 9}, "title <> ''").list_random(3)
  end

  def user_create
    @member = Member.new(
        :name => params[:member][:name],
        :email => params[:member][:email],
        :tel => params[:member][:tel],
        :sex_id => params[:member][:sex_id],
        :address => params[:member][:address]
    )
    if @member.save
      flash[:error_msg] = "申请成功！"
      redirect_to root_path and return
    else
      flash[:error_msg] = @member.errors.values.join('\r')
      redirect_to root_path and return
    end
  end

  # 手机号重复验证
  # 如果返回true   可以使用
  # 如果返回false   不可以使用
  def check_login
    tel = params[:member][:tel]
    render :text => Member.check_login_exist(tel) ? "false" : "true"
  end

  def panoramic_campus
    # 全景校区
    @category_1_name = Journalism.question_category_name(1)
    @category_1_questions = Journalism.where({:question_category_id => 1})
  end

  def school_activities
    # 校内活动
    @category_2_name = Journalism.question_category_name(3)
    @category_2_questions = Journalism.where({:question_category_id => 3})
  end

  def transcript
    # 历年成绩
    @category_3_name = Journalism.question_category_name(4)
    @category_3_questions = Journalism.where({:question_category_id => 4})
  end

  def school_culture
    # 学校文化
    @category_4_name = Journalism.question_category_name(5)
    @category_4_questions = Journalism.where({:question_category_id => 5})
  end

  def teacher_charisma
    # 教师风采
    @category_5_name = Journalism.question_category_name(6)
    @category_5_questions = Journalism.where({:question_category_id => 6})
  end

  def at_query
    # 分校查询
    @category_6_name = Journalism.question_category_name(7)
    @category_6_questions = Journalism.where({:question_category_id => 7})
  end

  def contact_us
    # 联系我们
    @category_7_name = Journalism.question_category_name(8)
    @category_7_questions = Journalism.where({:question_category_id => 8})
  end
end
