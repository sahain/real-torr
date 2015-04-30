module PropertiesHelper
  def format_price(property)
  	number_to_currency(property.price)
  end

  # def image_for(property, size)
  #	if property.pictures.exists?
  #    image_tag(property.pictures.first.image.url(size))


  def image_for(property)
  	if property.image.exists?
      image_tag(property.image.url(:profile))
    else
      image_tag('placeholder.png')
    end
  end

  def description_for(property) # change text later to better suit app
  	if property.description.blank?
  		content_tag(:p, "Bacon ipsum dolor sit amet rump ground round jowl pork belly ham hock. Venison chuck fatback ball tip, drumstick jerky sausage ground round pig andouille pork belly. Ball tip spare ribs chicken prosciutto andouille ribeye. Sausage andouille tenderloin sirloin leberkas pastrami. Ham fatback venison swine ball tip short loin boudin corned beef turducken bacon prosciutto t-bone pork. Porchetta cow meatball turducken shank, biltong pig doner landjaeger venison leberkas tri-tip bresaola.")
  	else
  		content_tag(:p, property.description)
  	end
  end

end
