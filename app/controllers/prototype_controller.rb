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
