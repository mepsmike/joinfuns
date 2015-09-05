module EventsHelper
  def render_collect_btn(event)
    return  "取消收藏" if  event.is_collected?(current_user)
    '收藏活動'
  end
end
