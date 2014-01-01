class Entity < ActiveRecord::Base
  has_many :observations, :dependent => :destroy

  validates :entity_name, :presence => true
end
