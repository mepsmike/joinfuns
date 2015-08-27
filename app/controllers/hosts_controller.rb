class HostsController < ApplicationController

  def show

    @host = User.find_by_id(params[:id])
    @in_progress_events = @host.events.where("end_time >= ?",Time.now)
    @overdue_events = @host.events.where("end_time < ?",Time.now)
    @in_progress_subjects = @host.subjects.where("end_time >= ?",Time.now)
    @overdue_subjects = @host.subjects.where("end_time < ?",Time.now)
    @events = Event.all


  end

end
