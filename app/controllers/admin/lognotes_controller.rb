class Admin::LognotesController < ApplicationController


    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_action :require_is_admin


  def index
    @lognotes = Lognote.all
  end

  def show
    @lognote = Lognote.find(params[:id])
  end

  def new
    @lognote = Lognote.new
  end

  def create
    @lognote = Lognote.new(lognote_params)
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
     :opco, :calldate, :handled_by, :resolved, :source, :attachment)
  end







end
