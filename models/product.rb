require_relative('../db/sql_runner')

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



  def delete()
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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
