require_relative('../db/sql_runner')

attri_reader :id
attr_accessor :name, :description, :ISBN, :date_published, :current_stock, :minimum_stock, :trade_price, :retail_price, :publisher_id, :author_id, :genre_id 


class Product(options)
  @id = options['id'].to_i
  @name = options['name']
  @description = options['description']
  @ISBN = options['isbn']
  @date_published = options['date_published']
  @current_stock = options['current_stock'].to_i
  @minimum_stock = options['minimum_stock'].to_i
  @trade_price = options['trade_price'].to_f
  @retail_price = options['retail_price'].to_f
  @publisher_id = options['publisher_id'].to_i
  @author_id = options['author_id'].to_i
  @genre_id = options['genre_id'].to_i
end
