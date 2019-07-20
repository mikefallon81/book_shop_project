require_relative('../db/sql_runner')

class Genre

  attr_reader :id
  attr_accessor :genre_type

  def initialize(options)
    @id = options['id'].to_i
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

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end
