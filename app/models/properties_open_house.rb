class PropertiesOpenHouse < ActiveRecord::Base
  belongs_to :properties
  belongs_to :open_houses
end
