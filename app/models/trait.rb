class Trait < ActiveRecord::Base
  has_many :measurements, :dependent => :destroy

  validates :trait_name, :presence => true

end
