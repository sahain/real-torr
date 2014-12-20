class PropertiesController < ApplicationController
  def index
    @properties = Property.all    
  end

  def show
    @property = Property.find(params[:id])
    @gallery = @property.gallery
    @picture = @property.pictures
    @open_houses = @property.open_houses.upcoming
  end

  def edit
  	@property = Property.find(params[:id])
  end

  def update
  	@property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property, notice: "Property successfully updated!"
    else
      render :edit
    end  	
  end

def new
  @property = Property.new
end

def create
  @property = Property.new(property_params)
  if @property.save
    redirect_to @property, notice: "Property successfully created!"
  else
     render :new
  end 
end

def destroy
  @property = Property.find(params[:id])
  @property.destroy
  redirect_to properties_url
end

private
  def property_params
  	params.require(:property).permit(:address1, :address2, :city, :state, :zip, :price, :image)
  end
end
