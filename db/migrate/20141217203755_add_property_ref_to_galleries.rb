class AddPropertyRefToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :property, index: true
  end
end
