class Row < ActiveRecord::Base
  belongs_to :project
  
  has_many :points, :dependent => :destroy
  accepts_nested_attributes_for :points, :reject_if => :all_blank, :allow_destroy => true
end
