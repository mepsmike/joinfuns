class Event < ActiveRecord::Base
  has_many :photos
  has_many :comments
  has_many :prices
  has_many :collects
  belongs_to :user
  has_many :user_collects, :through => :collects, :source => :user
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :prices

  as_enum :category, event: 0, dm: 1


  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  is_impressionable :counter_cache => true, :unique => true

  has_attached_file :cover, :styles => { :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  def self.search(args)
    address = args[:address]
    keyword = args[:keyword]
    combine_keyword = args[:combine_keyword]
    time_code = args[:time].to_i
    latitude = args[:latitude]
    longitude = args[:longitude]
    distance = args[:distance]



    # where(:title, query) -> This would return an exact match of the query
    filtered_events = Event.all

    #where("address like ?", "%#{address}%") unless address.blank?
    filtered_events = filtered_events.where("address like ? or title like ?", "%#{combine_keyword}%", "%#{combine_keyword}%" ) if combine_keyword.present?
    filtered_events = filtered_events.where("address like ?", "%#{address}%" ) if address.present?
    filtered_events = filtered_events.where("title like ?", "%#{keyword}%") if keyword.present?
    filtered_events = filter_by_time(code: time_code, collection: filtered_events) if time_code.present?
    filtered_events = filtered_events.near([latitude,longitude],distance, :units=>:km) if distance.present?
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
