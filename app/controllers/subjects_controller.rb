class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject= Subject.new(subject_params)
    @subject.user = current_user

    if @subject.save
      flash[:success] = "標案已成功建立！"
      redirect_to subjects_path
    else
      flash[:error] = "請檢查欄位後再試一次。"
      render :new
    end
  end

  def show

    @subject = Event.find(params[:id])

    @subjects = Event.includes(:photos, :prices).all # TODO, show filter out hotest events


  end

  private

  def subject_params
    params.require(:subject).permit(:title, :cover, :link, :email, :address, :price, :phone, :description, :budget, :showtime, :end_time)
  end

end
