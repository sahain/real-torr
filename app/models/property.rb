class Property < ActiveRecord::Base
  has_many :open_houses, dependent: :destroy
  has_one :gallery, dependent: :destroy
  has_many :pictures, through: :gallery

  #may be out of date with gallery tables added
  has_attached_file :image, styles: {
  small: "90x133>",
  medium: "200x300>",
  profile: "500x1400>",
  thumb: "50x50>"
},
  default_url: "placeholder.png"

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  #old validation on property imgage - need new one for gallery
  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png'] },
    :size => { :less_than => 2.megabyte }

end
