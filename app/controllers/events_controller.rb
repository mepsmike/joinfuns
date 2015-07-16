class EventsController < ApplicationController
	def index

		@event = Event.last
		@sticker = Geocoder.coordinates(@event.address)
		gon.sticker = @sticker
		render :template => "prototype/main"

	end

	def new

		@event= Event.new

	end

	def create

		@event= Event.new(get_params)
		@event.save
		redirect_to events_path
	end



	private

	def get_params

		params.require(:event).permit(:title,:description,:address,:hoster,:start_time,:end_time)
	end
end
