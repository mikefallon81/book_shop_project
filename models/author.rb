require_relative('../db/sql_runner')

class Author

  attr_reader
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO authors(first_name, last_name)
    VALUES ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    author = SqlRunner.run(sql, values)
    @id = author.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM authors
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end





end
