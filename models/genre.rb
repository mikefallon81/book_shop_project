require_relative('../db/sql_runner')

class Genre

  attr_reader :id
  attr_accessor :genre_type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @genre_type = options['genre_type']
  end

  def save()
    sql = "INSERT INTO genres(
    genre_type
    )
    VALUES ($1)
    RETURNING id;"
    values = [@genre_type]
    genre = SqlRunner.run(sql, values)
    @id = genre.first()['id'].to_i
  end

  def update()
    sql = "UPDATE genres
    SET genre_type
    = $1
    WHERE id = $2;"
    values = [@genre_type, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM genres
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM genres
    WHERE id = $1"
    values = [id]
    genres = SqlRunner.run( sql, values )
    result = Genre.new( genres.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run(sql)
    result = genres.map{|genre| Genre.new(genre)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end
