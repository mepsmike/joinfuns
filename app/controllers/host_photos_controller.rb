class HostPhotosController < ApplicationController

  def destroy

    @user=current_user
    get_my_photo

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

