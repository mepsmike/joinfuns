module EventsHelper

  def render_collect_btn(event)
    return  "取消收藏" if  event.is_collected?(current_user)
    '收藏活動'
  end

  def render_time(time)
    if time > Time.now.beginning_of_day
      time_ago_in_words(time)
    else
      time.strftime("%b %d, %Y")
    end
  end

end
