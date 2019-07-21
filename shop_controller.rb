require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/genre')
require_relative('models/product')
require_relative('models/publisher')
also_reload( './models/*' )

#INDEX
get '/products' do
  @products = Product.all
  erb(:index)
end

#CREATE
get '/products/new' do
  @product = Product.new
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:new)
end
