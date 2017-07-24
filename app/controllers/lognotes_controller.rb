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

  # def show
  #   @lognote = Lognote.find(params[:id])
  #
  #   colors = ['rgba(255, 99, 132, 0.2)',
  #         'rgba(54, 162, 235, 0.2)',
  #         'rgba(255, 206, 86, 0.2)',
  #         'rgba(75, 192, 192, 0.2)',
  #         'rgba(153, 102, 255, 0.2)',
  #         'rgba(255, 159, 64, 0.2)'
  #         ]
  #
  #   @data1 = {
  #       labels: "Red"
  #       datasets: [{
  #         label: "# of Registrations",
  #         data: @lognote.title.count,
  #         backgroundColor: colors,
  #         borderWidth: 1
  #         }]
  #   }
  # end



end
