class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
  end
  
  def history
    @round = Round.find(params[:id])
  end
end
