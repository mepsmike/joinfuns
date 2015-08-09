class EventCommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_event

  def create
    @comment=@event.comments.build(get_params)
    @comment.user=current_user
    @comment.save

    respond_to do |format|
     format.html {
       redirect_to event_path(@event)
     }
     format.js
    end

    #redirect_to topic_path(@topic)
  end

  def destroy
    get_my_comment
    @comment.destroy

    respond_to do |format|
     format.html {
       redirect_to event_path(@event)
     }
     format.js
    end

  end

  protected

  def get_params
    params.require(:comment).permit(:content,:user_id)
  end

  def get_event
    @event=Event.find(params[:event_id])
  end

  def get_my_comment
    @comment=current_user.comments.find(params[:id])
  end

end
