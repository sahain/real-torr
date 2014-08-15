module PropertiesHelper
  def format_price(property)
  	number_to_currency(property.price)
  end

  def image_for(property)
  	if property.image_file_name.blank?
  	  image_tag('placeholder.png')
  	else
  		image_tag(property.image_file_name)
  	end
  end

end
