class HostsController < ApplicationController

  def show

    @host = User.find_by_id(params[:id])
    @events = @host.events


  end

end
