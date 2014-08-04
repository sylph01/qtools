class EventsController < ApplicationController
  def index
    @events = Event.active_only
  end

  def show
    @event = Event.active_only.find(params[:id])
  end

  def messages
  end
end
