class Entity < ActiveRecord::Base
  has_many :observations, :dependent => :destroy

  validates :entity_name, :presence => true
  validates_uniqueness_of :entity_name
end
