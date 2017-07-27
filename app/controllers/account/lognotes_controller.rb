class Account::LognotesController < ApplicationController

  def index
    @lognotes = current_user.lognotes
  end



end
