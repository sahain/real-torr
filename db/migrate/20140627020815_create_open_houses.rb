class CreateOpenHouses < ActiveRecord::Migration
  def change
    create_table :open_houses do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :property, index: true

      t.timestamps
    end
  end
end
