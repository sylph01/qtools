class MatchImagesController < ApplicationController
  def new
    @match_image = MatchImage.new
    if params[:match_id]
      @match = Match.find(params[:match_id])
    end
  end

  def create
    @match_image = MatchImage.new(params[:match_image])

    respond_to do |format|
      if @match_image.save
        format.html { redirect_to @match_image, notice: 'Match image was successfully created.' }
        format.json { render json: @match_image, status: :created, location: @match_image }
      else
        format.html { render action: "new" }
        format.json { render json: @match_image.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @match_image = MatchImage.find(params[:id])
  end
end
