class Admin::ImportcsvController < ApplicationController

  def index
    @importcsvs = Importcsv.all
  end



  
  def import
    Lognote.import(params[:file])

    redirect_to root_url, notice: 'lognotes imported.'
  end


end
