require_relative('../db/sql_runner')
require_relative('./author')
require_relative('./genre')
require_relative('./publisher')


class Product

attr_reader :id
attr_accessor :name, :description, :isbn, :date_published, :current_stock, :minimum_stock, :trade_price, :retail_price, :publisher_id, :author_id, :genre_id


def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @description = options['description']
  @isbn = options['isbn']
  @date_published = options['date_published']
  @current_stock = options['current_stock'].to_i
  @minimum_stock = options['minimum_stock'].to_i
  @trade_price = options['trade_price'].to_f
  @retail_price = options['retail_price'].to_f
  @publisher_id = options['publisher_id'].to_i
  @author_id = options['author_id'].to_i
  @genre_id = options['genre_id'].to_i
end


def save()
  sql = "INSERT INTO products(
  name,
  description,
  isbn,
  date_published,
  current_stock,
  minimum_stock,
  trade_price,
  retail_price,
  publisher_id,
  author_id,
  genre_id
  )
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
  RETURNING id;"
  values = [@name, @description, @isbn, @date_published, @current_stock, @minimum_stock, @trade_price, @retail_price, @publisher_id, @author_id, @genre_id]
  product = SqlRunner.run(sql, values)
  @id = product.first()['id'].to_i
end

def author
    sql = "SELECT * FROM authors
    WHERE ID = $1"
    results = SqlRunner.run(sql, [@author_id])
    return Author.new(results.first)
end

def publisher
    sql = "SELECT * FROM publishers
    WHERE ID = $1"
    results = SqlRunner.run(sql, [@publisher_id])
    return Publisher.new(results.first)
end

def genre
    sql = "SELECT * FROM genres
    WHERE ID = $1"
    results = SqlRunner.run(sql, [@genre_id])
    return Genre.new(results.first)
end

  def update()
    sql = "UPDATE products
    SET
    (name,
    description,
    isbn,
    date_published,
    current_stock,
    minimum_stock,
    trade_price,
    retail_price,
    publisher_id,
    author_id,
    genre_id
    ) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11 )
    WHERE id = $12;"
    values = [@name, @description, @isbn, @date_published, @current_stock, @minimum_stock, @trade_price, @retail_price, @publisher_id, @author_id, @genre_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.filter_by_genre(id)
    sql = "SELECT * FROM products
    WHERE genre_id = $1"
    values = [id]
    products = SqlRunner.run( sql, values )
    result = products.map{|product| Product.new(product)}
    return result
  end

  def self.filter_by_author(id)
    sql = "SELECT * FROM products
    WHERE author_id = $1"
    values = [id]
    products = SqlRunner.run( sql, values )
    result = products.map{|product| Product.new(product)}
    return result
  end

  def self.filter_by_publisher(id)
    sql = "SELECT * FROM products
    WHERE publisher_id = $1"
    values = [id]
    products = SqlRunner.run( sql, values )
    result = products.map{|product| Product.new(product)}
    return result
  end

  def delete()
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.low_stock_warning()
    sql = "SELECT * FROM products
    WHERE (current_stock <= minimum_stock AND current_stock > 0)"
    stock_warning = SqlRunner.run(sql)
    result = stock_warning.map{|product| Product.new(product)}
    return result
  end

  def self.no_stock_warning()
    sql = "SELECT * FROM products
    WHERE current_stock = 0"
    stock_warning = SqlRunner.run(sql)
    result = stock_warning.map{|product| Product.new(product)}
    return result
  end

  def stock_increase(amount)
    @current_stock += amount
    sql = "UPDATE products
    SET current_stock = $1
    WHERE id = $2"
    values = [@id, @current_stock]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    products = SqlRunner.run( sql, values )
    result = Product.new( products.first )
    return result
  end

def self.all()
  sql = "SELECT * FROM products"
  products = SqlRunner.run(sql)
  result = products.map {|product| Product.new (product)}
  return result
end

def self.delete_all()
  sql = "DELETE FROM products"
  SqlRunner.run(sql)
end

end
