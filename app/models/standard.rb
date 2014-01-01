class Standard < ActiveRecord::Base
  has_many :measurements
  
  validates :standard_name, :presence => true
  validates_uniqueness_of :standard_name
end
