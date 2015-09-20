module HostsHelper
  def render_edit_btn(host)

    link_to '編輯',"#modal1",:class=>"waves-effect waves-light btn modal-trigger" if host == current_user

  end

  def render_edit_form(host)

    render partial: "partials/hoster_edit_form" if host == current_user

  end

  def render_input_or_image(image,host)
    if image.empty?

      4.times do
        concat render partial:"partials/hoster_edit_form_photo" ,:locals => { :f => host }
      end

    else

      image.each do |img|



        concat content_tag(:div,id:"img-<%=img.id%>") do
          concat image_tag img.pic.url(:thumb)
          concat link_to "刪除", host_photo_path(host,img),:remote => true,:method =>:delete
        end

        concat content_tag(:div,id:"input-<%=img.id%>",style:"display:none") do

          concat render partial: "partials/hoster_edit_form_photo", locals: { :f => host }

        end

      end

      (4-image.length).times.each do

        concat render partial: "partials/hoster_edit_form_photo", locals: { :f => host }

      end

    end

  end

  # def render_file_input(image)

  #   if image
  #     1.times{render partial:"partials/hoster_edit_form_photo", :locals => { :f => f }}
  #   else
  #     4.times{render partial:"partials/hoster_edit_form_photo" ,:locals => { :f => f }}
  #   end

  # end
end
