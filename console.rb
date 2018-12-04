
require('pry')

require_relative('models/property')


property_1 = Property.new({
  'address' => '1 Princes St.',
  'no_bedrooms' => '4',
  'value' => '1000000',
  'sq_footage' => '50000'
  })
