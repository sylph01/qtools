# encoding: utf-8
class RoundsController < ApplicationController
  layout "full_display", :only => :list
  
  # GET /rounds
  # GET /rounds.json
  def index
    if params[:event_id]
      @event = Event.find(params[:event_id])
      @rounds = Round.where("event_id = ?", params[:event_id])
    else
      @rounds = Round.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rounds }
    end
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @round = Round.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round }
    end
  end

  # GET /rounds/new
  # GET /rounds/new.json
  def new
    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = nil
    end
    @round = Round.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round }
    end
  end

  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(params[:round])

    respond_to do |format|
      if @round.save
        # create matches for input
        if !params[:names].blank?
          # split input by line break
          names = params[:names].rstrip.split(/\r?\n/).map{|line| line.chomp}
          # insert dummy players
          if names.length % 4 == 3
            names.insert(names.length,"★ダミーＰ")
          elsif names.length % 4 == 2
            names.insert(names.length,"★ダミーＰ")
            names.insert(names.length-4,"★ダミーＰ")
          elsif names.length % 4 == 1
            names.insert(names.length,"★ダミーＰ")
            names.insert(names.length-4,"★ダミーＰ")
            names.insert(names.length-4,"★ダミーＰ")
          end
          # sort if required
          if params[:sort] == "1"
            names = names.sort_by{rand}
          end
          courts = params[:courts].to_i
          court_select = ["A", "B", "C", "D", "E", "F"]
          # for each 4 names create match
          (names.length / 4).times do |x|
            match = Match.new
            match.round_id = @round.id
            match.court = court_select[x % courts]
            match.player1_name = names[x * 4]
            match.player2_name = names[x * 4 + 1]
            match.player3_name = names[x * 4 + 2]
            match.player4_name = names[x * 4 + 3]
            match.save
          end
        end
        
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render json: @round, status: :created, location: @round }
      else
        format.html { render action: "new" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rounds/1
  # PUT /rounds/1.json
  def update
    @round = Round.find(params[:id])

    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    respond_to do |format|
      format.html { redirect_to rounds_url }
      format.json { head :no_content }
    end
  end
  
  def matches
    @round = Round.find(params[:id])
    @matches = @round.matches
  end
  
  def new_match
    @round = Round.find(params[:id])
    @match = Match.new
  end
  
  def passes
    @round = Round.find(params[:id])
  end
  
  def passes_by_form
    @round = Round.find(params[:id])
  end
  
  def list
    @round = Round.find(params[:id])
  end
  
  def score_table
    @round = Round.find(params[:id])
  end
end
