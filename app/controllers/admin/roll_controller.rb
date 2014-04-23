class Admin::RollController < Admin::MainController
  layout 'admin'
  before_action :roll_params, only: [:create]
  before_filter :get_roll, only: [:destroy]

  def index
    @roll = Roll.all.order_ct_desc.page(params[:page]).per(5)
  end

  def new
    @roll = Roll.new
  end

  def create
    if request.post?
      if params[:roll]
        avatar = params[:roll][:avatar]
        url = params[:roll][:url]
        question_category_id = params[:roll][:question_category_id]
        imagename = avatar.original_filename
        avatar.original_filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<imagename[imagename.length-4, 4]
        if !avatar.blank? && !url.blank? && !question_category_id.blank?
          rc = Roll.create(:avatar => avatar, :url => url, :question_category_id => question_category_id)
          if rc.valid?
          else
            msg = ""
            rc.errors.full_messages.each { |error| msg+= error }
            flash[:error]= msg
            redirect_to :back and return
          end
          redirect_to admin_roll_index_path and return
        else
          flash[:error_msg]="添加失败，请检查添加项是否有空值！"
          redirect_to :back
        end
      end
    end
  end

  def destroy
    @roll = Roll.find params[:id]
    Roll.deletefile(@roll.id)
    @roll.destroy
    redirect_to admin_roll_index_path
  end

  private
  def get_roll
    @roll = Roll.where(:id => params[:id]).first
  end

  def roll_params
    params.require(:roll).permit(:avatar, :url, :question_category_id)
  end
end
