class Property < ActiveRecord::Base
  has_many :open_houses, dependent: :destroy
end
