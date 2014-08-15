module PropertiesHelper
  def format_price(property)
  	number_to_currency(property.price)
  end
end
