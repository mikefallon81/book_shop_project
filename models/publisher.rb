require_relative('../db/sql_runner')

class Publisher

  attr_reader :id
  attr_accessor :name, :street, :city, :postcode, :phone, :email

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @street = options['street']
    @city = options['city']
    @postcode = options['postcode']
    @phone = options['phone']
    @email = options['email']
  end

  

end
