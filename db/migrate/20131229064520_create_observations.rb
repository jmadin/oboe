class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.references :project, index: true
      t.references :entity, index: true

      t.timestamps
    end
  end
end
