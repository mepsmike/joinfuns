class PrototypeController < ApplicationController

  def index
    render layout: 'landing'
  end

  def sign_in
    render layout: 'landing'
  end

  def sign_up
    render layout: 'landing'
  end

  def main
    render layout: 'map_view'
  end

  def subjects_index
  end

  def subject_show
  end

end
