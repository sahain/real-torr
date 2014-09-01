class CreatePropertiesOpenHouses < ActiveRecord::Migration
  def change
    create_table :properties_open_houses do |t|
      t.references :properties, index: true
      t.references :open_houses, index: true

      t.timestamps
    end
  end
end
