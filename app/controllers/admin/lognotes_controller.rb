class Admin::LognotesController < ApplicationController


    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_action :require_is_admin
    before_action :validate_search_key, only: [:search]

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


  def search
    if @query_string.present?
      search_result = Lognote.ransack(@search_criteria).result(:distinct => true)
      @lognotes = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  protected

  def validate_search_key
   @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
   @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
   { :title_or_description_or_caseid_or_organization_or_handled_by_cont => query_string }
  end




  private

  def lognote_params
    params.require(:lognote).permit(:caseid, :title, :description, :organization, :customertype,
     :opco, :calldate, :handled_by, :be_resolved, :source, :attachment, :image)
  end







end
