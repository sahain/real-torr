class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :image
      t.references :gallery, index: true
      t.string :gallery_token

      t.timestamps
    end
  end
end
