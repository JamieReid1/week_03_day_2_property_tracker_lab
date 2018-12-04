require('pg')

class Property

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @no_bedrooms = options['no_bedrooms']
    @value = options['value'].to_i
    @sq_footage = options['sq_footage'].to_i
  end



end
