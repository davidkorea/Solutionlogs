class LognotesController < ApplicationController

  def index
    @lognotes = Lognote.all

    respond_to do |format|
      format.html
      format.csv { send_data @lognotes.to_csv }
      format.xls
    end
  end

  def import
    Lognote.import(params[:file])

    redirect_to root_url, notice: 'lognotes imported.'
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
      redirect_to lognotes_path
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
      redirect_to lognotes_path
      flash[:notice] = "Updated"
    else
      render :edit
    end
  end

  def destroy
    @lognote = Lognote.find(params[:id])
    @lognote.destroy
    flash[:alert] = "Deleted"
    redirect_to lognotes_path
  end





  private
  def lognote_params
    params.require(:lognote).permit(:caseid, :title, :description, :organization, :customertype,
     :opco, :calldate, :handled_by, :resolved, :source, :attachment)
   end

end
