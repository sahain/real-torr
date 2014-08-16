class OpenHousesController < ApplicationController
  before_action :set_property

  def index
  	@open_houses = @property.open_houses
  end

  def new
  	@open_house = @property.open_houses.new
  end

  def create
    @open_house = @property.open_houses.new(open_house_params)
    if @open_house.save
    	redirect_to property_path(@property),
    	notice: "Open house added."
    else
    	render :new
    end
  end

  private

    def open_house_params
      params.require(:open_house).permit(:starts_at, :ends_at)
    end

    def set_property
      @property = Property.find(params[:property_id])
    end
end
