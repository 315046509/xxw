class MainController < ApplicationController
  def index
    @category_1_name = Roll.question_category_name(1)
    @category_1_questions = Roll.where({:question_category_id => 1})
    @category_2_name = Roll.question_category_name(2)
    @category_2_questions = Roll.where({:question_category_id => 2})
    @category_4_name = Journalism.question_category_name(4)
    @category_4_questions = Journalism.where({:question_category_id => 4}, "title <> ''").list_random(3)
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

  def campus
    # 学校简介
    @category_1_name = Journalism.question_category_name(1)
    @category_1_questions = Journalism.where({:question_category_id => 1}).page(params[:page]).per(1)
    @category_4_name = Journalism.question_category_name(4)
    @category_4_questions = Journalism.where({:question_category_id => 4}, "title <> ''").list_random(3)
  end

  def teacher
    # 教师简介
    @category_2_name = Journalism.question_category_name(2)
    @category_2_questions = Journalism.where({:question_category_id => 2})
    @category_4_name = Journalism.question_category_name(4)
    @category_4_questions = Journalism.where({:question_category_id => 4}, "title <> ''").list_random(3)
  end

  def contact_us
    # 联系我们
    @category_3_name = Journalism.question_category_name(3)
    @category_3_questions = Journalism.where({:question_category_id => 3})
    @category_4_name = Journalism.question_category_name(4)
    @category_4_questions = Journalism.where({:question_category_id => 4}, "title <> ''").list_random(3)
  end
end
