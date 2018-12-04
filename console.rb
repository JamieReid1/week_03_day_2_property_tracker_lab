
require('pry')

require_relative('models/property')


property_1 = Property.new({
  'address' => '1 Princes St.',
  'no_bedrooms' => '4',
  'value' => '1000000',
  'sq_footage' => '50000'
  })

property_2 = Property.new({
  'address' => '1 Abbey Road',
  'no_bedrooms' => '2',
  'value' => '500000',
  'sq_footage' => '20000'
  })

Property.delete_all()

property_1.save()
property_2.save()

properties = Property.all()

binding.pry
nil
