class Context < ActiveRecord::Base
  belongs_to :project
  belongs_to :observation, :class_name => "Observation"
  belongs_to :has_context, :class_name => "Observation"

  validates :observation, :presence => true
  validates :has_context, :presence => true


  validate :check_not_same

  def check_not_same
    errors.add(:has_context, "can't be the same") if self.observation == self.has_context
  end
  
end
