class EventsController < ApplicationController
	def index
    @event = Event.last
    @sticker = Geocoder.coordinates(@event.address)
    gon.sticker = @sticker


    render :template => "prototype/main"


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

end
