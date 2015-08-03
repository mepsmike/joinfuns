class Event < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  as_enum :category, event: 0, dm: 1

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



  def self.search(address,keyword,time)
    # where(:title, query) -> This would return an exact match of the query
    test = Event.all

    #where("address like ?", "%#{address}%") unless address.blank?
    test = test.where("address like ?", "%#{address}%" ) unless address.blank?
  #Rails.logger.debug("ing")
  #Rails.logger.debug(@events)
    test = test.where("title like ?","%#{keyword}%") unless keyword.blank?

    time = case

    when 0
      test=test.between_times(Time.zone.now - 1.weeks,Time.zone.now) unless time.blank?
    when 1
      test=test.between_times(Time.zone.now - 2.weeks,Time.zone.now) unless time.blank?
    when 2
      test=test.between_times(Time.zone.now - 4.weeks,Time.zone.now) unless time.blank?
    when 3
      test=test.between_times(Time.zone.now - 24.weeks,Time.zone.now) unless time.blank?
    end

    test
  #Rails.logger.debug("after")
  #Rails.logger.debug(@events)
  end


end
