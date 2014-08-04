# encoding: utf-8
class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    
    if @match.update_attributes(params[:match])
      redirect_to @match, notice: "入力が完了しました。"
    else
      render action: "edit"
    end
  end

  def new
  end

  def create
  end
  
  def history
    @match = Match.find(params[:id])
  end
  
  def confirm
    @match = Match.find(params[:id])
    @match.attributes = params[:match]
    @match.image.store!(params[:match][:image])
    @match.update_attribute(:image, params[:match][:image])
  end
end
