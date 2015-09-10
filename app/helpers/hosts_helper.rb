module HostsHelper
  def render_edit_btn(host)

    link_to '編輯',"#modal1",:class=>"waves-effect waves-light btn modal-trigger" if host == current_user

  end

  def render_edit_form(host)

    render partial: "partials/hoster_edit_form" if host == current_user

  end

  # def render_file_input(image)

  #   if image
  #     1.times{render partial:"partials/hoster_edit_form_photo", :locals => { :f => f }}
  #   else
  #     4.times{render partial:"partials/hoster_edit_form_photo" ,:locals => { :f => f }}
  #   end

  # end
end
