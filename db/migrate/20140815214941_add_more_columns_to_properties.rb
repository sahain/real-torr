class AddMoreColumnsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :active, :boolean
    add_column :properties, :featured, :boolean
    add_column :properties, :image_file_name, :string
  end
end
