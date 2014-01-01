class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :row, index: true
      t.references :measurement, index: true
      t.string :value

      t.timestamps
    end
  end
end
