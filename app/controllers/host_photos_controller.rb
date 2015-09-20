class HostPhotosController < ApplicationController

  def destroy

    get_my_photo
    @host = current_user
    @photos = current_user.photos
    @photo.destroy


    respond_to do |format|

     format.js

    end

  end

  protected


  def get_my_photo
    @photo=current_user.photos.find(params[:id])

  end

end

