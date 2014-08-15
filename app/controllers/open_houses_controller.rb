class OpenHousesController < ApplicationController
  def index
  	@open_houses = OpenHouse.all
  end

  def create
    
  end
end
