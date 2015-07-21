class EventsController < ApplicationController
  layout :setting_layout

  def index

    @events = Event.all

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      address=Geocoder.coordinates(event.address)
      marker.lat address[0]
      marker.lng address[1]
      marker.json({ :id => event.id })
      if event.category_cd == 1
        marker.picture({
          :url => view_context.image_path("dm-icon@2x.png"),
          :width   => 86,
          :height  => 102
        })
      else
        marker.picture({
          :url => view_context.image_path("event-icon@2x.png"),
          :width   => 86,
          :height  => 102
        })
      end
    end

  end

  def show
    @event = Event.find(params[:id])
    #@sticker = Geocoder.coordinates(@event.address)
    #gon.sticker = @sticker
    respond_to do |format|
      format.html
      format.js
    end
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
    when 'index', 'show'
      'map_view'
    else
      'application'
    end
  end
end
