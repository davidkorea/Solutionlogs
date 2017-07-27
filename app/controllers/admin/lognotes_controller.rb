class Admin::LognotesController < ApplicationController


    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_action :require_is_admin

    layout "admin"

    def import
      Lognote.import(params[:file])

      redirect_to root_url, notice: 'lognotes imported.'
    end

  def index
    @lognotes = Lognote.all.paginate(:page => params[:page], :per_page =>15)
  end

  def show
    @lognote = Lognote.find(params[:id])
  end

  def new
    @lognote = Lognote.new
  end

  def create
    @lognote = Lognote.new(lognote_params)
    @lognote.user = current_user
    if @lognote.save
      redirect_to admin_lognotes_path
    else
      render :new
    end
  end

  def edit
    @lognote = Lognote.find(params[:id])
  end

  def update
    @lognote = Lognote.find(params[:id])
    if @lognote.update(lognote_params)
      redirect_to admin_lognotes_path
    else
      render :edit
    end
  end

  def destroy
    @lognote = Lognote.find(params[:id])
    @lognote.destroy
    flash[:alert] = "Deleted"
    redirect_to admin_lognotes_path
  end




  private

  def lognote_params
    params.require(:lognote).permit(:caseid, :title, :description, :organization, :customertype,
     :opco, :calldate, :handled_by, :be_resolved, :source, :attachment, :image)
  end







end
