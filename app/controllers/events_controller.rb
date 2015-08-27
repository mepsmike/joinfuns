class EventsController < ApplicationController
  layout :setting_layout
  impressionist :actions=>[:show]

  def index

    set_events
    events_order

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
    #@hit_count = @event.impressionist_count(:filter=>:ip_address)
    @events = Event.includes(:photos, :prices).all # TODO, show filter out hotest events
    #@sticker = Geocoder.coordinates(@event.address)
    #gon.sticker = @sticker
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    @comment = Comment.new
    @comments = @event.comments.order("created_at desc")
    # render "prototype/dm_poster"
    @collect = get_collect
  end

  def new
    @event= Event.new

    #8.times{ @event.photos.build }
    3.times{ @event.prices.build }
  end

  def create
    @event= Event.new(event_params)
    @event.user = current_user
    category = view_context.te(@event, :category)

    if @event.save
      flash[:success] = "#{category} 已成功建立！"
      redirect_to events_path
    else
      flash[:error] = "請檢查欄位後再試一次。"
      render :new
    end
  end

  def collect

    @event = Event.find(params[:id])

    collect = get_collect

    if collect
      collect.destroy
    else
      current_user.collects.create!( :event => @event )
    end

    respond_to do |format|
     format.html {
       redirect_to event_path(@event)
     }
     format.js
    end


  end

  # def search
  #   @events = @events.where("address like ?", params[:address]) unless address.blank?
  #   @events = @events.where("title like ?", params[:keyword]) unless keyword.blank?
  #   @events
  # end

  private

  def event_params
    params.require(:event).permit(:title, :category, :contact_phone, :email, :website, :organizer, :price, :event_type, :description, :address, :hoster, :start_time, :end_time, :cover, :budget, :showtime, prices_attributes:[:price])
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
    combine_keyword = params[:combine_keyword]
    time = params[:time]
    distance = params[:distance]
    latitude = cookies[:lat]
    longitude = cookies[:lng]

    return @events = Event.includes(:photos, :prices).search(combine_keyword: combine_keyword, time: time, keyword: keyword, address: address, distance: distance, latitude: latitude, longitude: longitude) if params[:search]
    @events = Event.includes(:photos, :prices).all
  end

  def events_order

    if params[:order]

      sort_by = case params[:order]
        when 'hottest'
          'impressions_count DESC '
        when 'newest'
          'created_at DESC'
      end

      @events = @events.order(sort_by)
    else
      @events = @events.order("events.id desc")
    end

  end

  def get_collect

    current_user.collects.find_by_event_id( params[:id] )

  end

end
