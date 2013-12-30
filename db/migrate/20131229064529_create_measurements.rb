class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :observation, index: true
      t.references :trait, index: true
      t.string :value

      t.timestamps
    end
  end
end
