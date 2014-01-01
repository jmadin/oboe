class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :project, index: true

      t.timestamps
    end
  end
end
