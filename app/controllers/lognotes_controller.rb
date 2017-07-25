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



end
