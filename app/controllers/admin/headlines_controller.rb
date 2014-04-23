class Admin::HeadlinesController < Admin::MainController
  layout 'admin'

  def index
    @journalisms = Xinwen.order_id_desc.page(params[:page]).per(10)
  end

  def new
    @journalism = Xinwen.new
  end

  def create
    @journalism = Xinwen.new(
        :title => params[:xinwen][:title],
        :descrpiton => params[:xinwen][:descrpiton],
        :question_category_id => params[:xinwen][:question_category_id]
    )
    if @journalism.save
      flash[:note] = "创建成功"
      redirect_to admin_headlines_path and return
    else
      flash[:error_msg] = @journalism.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def edit
    @journalism = Xinwen.find(params[:id])
  end

  def update
    @category = Xinwen.find(params[:id])
    update_category = @category.update_attributes(
        :title => params[:xinwen][:title],
        :descrpiton => params[:xinwen][:descrpiton],
        :question_category_id => params[:xinwen][:question_category_id]
    )
    if update_category
      respond_to do |category|
        category.html {
          redirect_to admin_headlines_path and return
        }
      end
    end
  end

  def show
    @journalism = Xinwen.find params[:id]
  end

  #   删除
  def destroy
    @journalism = Xinwen.find(params[:id])
    flash[:error_msg] = @journalism.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_headlines_path and return
  end
end
