class Comment < ActiveRecord::Base
  belongs_to :event, :counter_cache => true
  belongs_to :user

  def show_time(time)

    if time > Time.now.beginning_of_day
      time_ago_in_words(time)
    else
      time.strftime("%b %d, %Y")
    end

  end

end
