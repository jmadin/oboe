class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :trait_name

      t.timestamps
    end
  end
end
