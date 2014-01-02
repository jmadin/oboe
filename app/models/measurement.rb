class Measurement < ActiveRecord::Base
  belongs_to :observation
  belongs_to :trait
  belongs_to :standard
  
  validates :trait, :presence => true
  validates :standard, :presence => true
  
  has_many :points, :dependent => :destroy
  accepts_nested_attributes_for :points, :reject_if => :all_blank, :allow_destroy => true
end
