# encoding: utf-8
class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end
  
  def history
    @match = Match.find(params[:id])
  end
end
