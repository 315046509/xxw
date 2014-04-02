class Admin::RollController < ApplicationController
  layout 'admin'
  before_action :roll_params, only: [:create]
  before_filter :get_roll, only: [:destroy]

  def index
    @roll = Roll.all.order("id desc").page(params[:page]).per(10)
  end

  def new
    @roll = Roll.new
  end

  def create
    @roll = Roll.new(roll_params)
    respond_to do |format|
      if @roll.save
        format.html { redirect_to admin_roll_index_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @roll.destroy
    redirect_to admin_roll_index_path
  end

  private
  def get_roll
    @roll = Roll.where(:id => params[:id]).first
  end

  def roll_params
    params.require(:roll).permit(:avatar, :url)
  end
end
