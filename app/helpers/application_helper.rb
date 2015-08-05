module ApplicationHelper
  def image_placeholder(args)
    width = args[:width] || '300'
    height = args[:height] || '300'
    text = args[:text] || "#{width} x #{height}"
    classes = args[:class] || ""

    image_tag "http://placehold.it/#{width}x#{height}&text=#{text}", :class => "#{classes}"
  end

  def get_avatar_url(args = {})
    user = args.fetch(:user, current_user)
    width = args.fetch(:width, 100)
    height = args.fetch(:width, 100)

    "https://graph.facebook.com/#{user.fb_uid}/picture?height=#{height}&width=#{width}"
  end
end
