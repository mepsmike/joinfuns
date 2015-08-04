class Event < ActiveRecord::Base
  has_many :photos
  has_many :comments
  accepts_nested_attributes_for :photos

  as_enum :category, event: 0, dm: 1

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def self.search(args)
    address = args[:address]
    keyword = args[:keyword]
    time_code = args[:time].to_i

    # where(:title, query) -> This would return an exact match of the query
    filtered_events = Event.all

    #where("address like ?", "%#{address}%") unless address.blank?
    filtered_events = filtered_events.where("address like ?", "%#{address}%" ) if address.present?
    filtered_events = filtered_events.where("title like ?", "%#{keyword}%") if keyword.present?
    filtered_events = filter_by_time(code: time_code, collection: filtered_events) if time_code.present?
    filtered_events
  end

  private

  def self.filter_by_time(args)
    code = args[:code]
    collection = args[:collection]
    current_time = Time.zone.now

    case code
    when 0
      collection.between_times(current_time - 1.weeks, current_time)
    when 1
      collection.between_times(current_time - 2.weeks, current_time)
    when 2
      collection.between_times(current_time - 4.weeks, current_time)
    when 3
      collection.between_times(current_time - 24.weeks, current_time)
    end
  end

end
