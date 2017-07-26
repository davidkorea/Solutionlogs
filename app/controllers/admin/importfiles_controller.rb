class Admin::ImportfilesController < ApplicationController

  layout 'admin'
  
  def import
    Lognote.import(params[:file])

    redirect_to root_url, notice: 'lognotes imported.'
  end



end
