class Property < ActiveRecord::Base
  has_many :open_houses, dependent: :destroy
  has_attached_file :image

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png'] },
    :size => { :less_than => 1.megabyte }
end
