class Property < ActiveRecord::Base
  has_many :open_houses, dependent: :destroy

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
end
