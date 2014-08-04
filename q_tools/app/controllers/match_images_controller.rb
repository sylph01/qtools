class MatchImagesController < ApplicationController
  # GET /match_images
  # GET /match_images.json
  def index
    @match_images = MatchImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_images }
    end
  end

  # GET /match_images/1
  # GET /match_images/1.json
  def show
    @match_image = MatchImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match_image }
    end
  end

  # GET /match_images/new
  # GET /match_images/new.json
  def new
    @match_image = MatchImage.new
    if params[:match_id]
      @match = Match.find(params[:match_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match_image }
    end
  end

  # GET /match_images/1/edit
  def edit
    @match_image = MatchImage.find(params[:id])
  end

  # POST /match_images
  # POST /match_images.json
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

  # PUT /match_images/1
  # PUT /match_images/1.json
  def update
    @match_image = MatchImage.find(params[:id])

    respond_to do |format|
      if @match_image.update_attributes(params[:match_image])
        format.html { redirect_to @match_image, notice: 'Match image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_images/1
  # DELETE /match_images/1.json
  def destroy
    @match_image = MatchImage.find(params[:id])
    @match_image.destroy

    respond_to do |format|
      format.html { redirect_to match_images_url }
      format.json { head :no_content }
    end
  end
end
