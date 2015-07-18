class Event < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos
end
