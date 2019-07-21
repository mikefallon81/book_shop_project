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

get '/products/publisher' do
  @publisher = Publisher.all
  erb(:publisher)
end

#CREATE
get '/products/new' do
  @product = Product.all
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:new_product)
end

post '/products/' do
  Product.new(params).save
  redirect to '/products'
end

get 'publisher/new' do
  @publisher = Publisher.all
  erb(:new_publisher)
end

get '/products/:id/view' do
  @product = Product.find(params[:id])
  @publisher = Publisher.all
  @author = Author.all
  @genre = Genre.all
  erb(:product_details)
end
