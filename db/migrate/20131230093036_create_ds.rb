class CreateDs < ActiveRecord::Migration
  def change
    create_table :ds do |t|
      t.references :measurement, index: true
      t.string :value

      t.timestamps
    end
  end
end
