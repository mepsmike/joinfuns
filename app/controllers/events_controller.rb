class EventsController < ApplicationController
  layout :setting_layout

  def index

    set_events


    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      #address=Geocoder.coordinates(event.address)
      marker.lat event.latitude
      marker.lng event.longitude
      marker.json({ :id => event.id })
      marker.picture({
        :url => view_context.image_path("#{event.category}-icon@2x.png"),
        :width   => 86,
        :height  => 102
      })
    end

  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all # TODO, show filter out hotest events
    #@sticker = Geocoder.coordinates(@event.address)
    #gon.sticker = @sticker
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    @comment = Comment.new
    @comments = @event.comments
    # render "prototype/dm_poster"
  end

  def new
    @event= Event.new

    8.times{ @event.photos.build }
  end

  def create
    @event= Event.new(event_params)
    category = view_context.te(@event, :category)

    if @event.save
      flash[:success] = "#{category} 已成功建立！"
      redirect_to events_path
    else
      flash[:error] = "請檢查欄位後再試一次。"
      render :new
    end
  end

  # def search
  #   @events = @events.where("address like ?", params[:address]) unless address.blank?
  #   @events = @events.where("title like ?", params[:keyword]) unless keyword.blank?
  #   @events
  # end

  private

  def event_params
    params.require(:event).permit(:title, :category, :contact_phone, :email, :website, :organizer, :price, :event_type, :description, :address, :hoster, :start_time, :end_time, photos_attributes:[:pic], prices_attributes:[:price1,:price2,:price3])
  end

  def setting_layout
    case action_name
    when 'index'
      'map_view'
    else
      'application'
    end
  end

  def set_events
    address = params[:address]
    keyword = params[:keyword]
    time = params[:time]
    distance = params[:distance]
    latitude = cookies[:lat]
    longitude = cookies[:lng]

    return @events = Event.search(time: time, keyword: keyword, address: address, distance: distance, latitude: latitude, longitude: longitude) if params[:search]
    @events = Event.all
  end

end
