class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :standard_name

      t.timestamps
    end
  end
end
