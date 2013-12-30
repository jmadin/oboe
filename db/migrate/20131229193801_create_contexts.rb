class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.references :project, index: true
      t.references :observation, index: true
      t.references :has_context, index: true

      t.timestamps
    end
  end
end
