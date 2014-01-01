class Trait < ActiveRecord::Base
  has_many :measurements, :dependent => :destroy

  validates :trait_name, :presence => true
  validates_uniqueness_of :trait_name

end
