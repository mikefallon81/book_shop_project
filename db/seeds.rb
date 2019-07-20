require_relative('../models/product.rb')
require_relative('../models/author.rb')
require('pry-byebug')

# Author.delete_all
# Product.delete_all

author1 = Author.new({
  'first_name' => 'David',
  'last_name' => 'McFarland'
  })

author1.save()

product1 = Product.new({
  'name' => 'CSS: The Missing Manual',
  'description' => 'the book that should have been in the box',
  'isbn' => '978-1-491-91805-0',
  'date_published' => '01/06/2014',
  'current_stock' => 10,
  'minimum_stock' => 5,
  'trade_price' => 22.95,
  'retail_price' => 25.00,
  'publisher_id' => 1,
  'author_id' => 1,
  'genre_id' => 1
  })

product1.save()


binding.pry
nil
