class EventsController < ApplicationController
  layout :setting_layout

  def index
    @event = Event.last
    @sticker = Geocoder.coordinates(@event.address)
    gon.sticker = @sticker
  end

  def new
    @event= Event.new

    8.times{ @event.photos.build }
  end

  def create
    @event= Event.new(get_params)
    @event.save

    redirect_to events_path
  end



  private

  def get_params
    params.require(:event).permit(:title, :contact_phone, :price, :event_type, :description, :address, :hoster, :start_time, :end_time, photos_attributes:[:pic])
  end

  def setting_layout
    case action_name
    when 'index'
      'map_view'
    else
      'application'
    end
  end
end
