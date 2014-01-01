class Point < ActiveRecord::Base
  belongs_to :row
  belongs_to :measurement
end
