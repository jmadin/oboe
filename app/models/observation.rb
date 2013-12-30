class Observation < ActiveRecord::Base
  belongs_to :project
  belongs_to :entity
  validates :entity, :presence => true
  
  has_many :measurements, :dependent => :destroy
  accepts_nested_attributes_for :measurements, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :observations, :class_name => "Context", :foreign_key => "observation_id", :dependent => :destroy
  accepts_nested_attributes_for :observations, :reject_if => :all_blank, :allow_destroy => true

  has_many :has_contexts, :class_name => "Context", :foreign_key => "has_context_id", :dependent => :destroy
  accepts_nested_attributes_for :has_contexts, :reject_if => :all_blank, :allow_destroy => true

end
