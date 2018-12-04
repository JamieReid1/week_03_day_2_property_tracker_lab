require('pg')

class Property

  attr_accessor :address, :no_bedrooms, :value, :sq_footage
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @no_bedrooms = options['no_bedrooms'].to_i
    @value = options['value'].to_i
    @sq_footage = options['sq_footage'].to_i
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO properties (
           address,
           no_bedrooms,
           value,
           sq_footage
          )
          VALUES (
           $1, $2, $3, $4
          )
          RETURNING *
          "
    values = [@address, @no_bedrooms, @value, @sq_footage]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM properties"
    db.prepare('delete_all', sql)
    db.exec_prepared('delete_all')
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties"
    db.prepare('all', sql)
    property = db.exec_prepared('all')
    db.close()
    return property.map { |property| Property.new(property) }
  end



end
