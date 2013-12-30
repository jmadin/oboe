class AddStandardToMeasurement < ActiveRecord::Migration
  def change
    add_reference :measurements, :standard, index: true
  end
end
