class Event < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  as_enum :category, event: 0, dm: 1
end
