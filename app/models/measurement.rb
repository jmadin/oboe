class Measurement < ActiveRecord::Base
  belongs_to :observation
  belongs_to :trait
  belongs_to :standard
end
