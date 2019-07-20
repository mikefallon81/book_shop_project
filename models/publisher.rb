require_relative('../db/sql_runner')

class Publisher

  attr_reader :id
  attr_accessor :name, :street, :city, :postcode, :phone, :email

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @street = options['street']
    @city = options['city']
    @postcode = options['postcode']
    @phone = options['phone']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO publishers(
    name,
    street,
    city,
    postcode,
    phone,
    email
    )
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id;"
    values = [@name, @street, @city, @postcode, @phone, @email]
    publisher = SqlRunner.run(sql, values)
    @id = publisher.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM publishers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    publishers = SqlRunner.run(sql)
    result = publishers.map{|publisher| Publisher.new(publisher)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

end
