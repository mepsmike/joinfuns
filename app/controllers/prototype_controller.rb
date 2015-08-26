class PrototypeController < ApplicationController
  layout :setting_layout

  def index
  end

  def sign_in
  end

  def sign_up
  end

  def main
  end

  def subjects_index
  end

  def subject_show
  end

  def dm_poster

  end

  def host_page
    @events = Event.all
  end

  def host_new_subject

  end

  def host_new_event

  end

  private

  def setting_layout
    case action_name
    when 'index', 'sign_in', 'sign_up'
      'landing'
    when 'main'
      'map_view'
    else
      'application'
    end
  end
end
