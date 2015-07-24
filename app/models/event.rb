class Event < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  as_enum :category, event: 0, dm: 1

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



  def self.search(address)
    # where(:title, query) -> This would return an exact match of the query
    where("address like ?", "%#{address}%")
  end


end
