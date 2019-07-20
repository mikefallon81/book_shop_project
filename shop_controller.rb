require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/genre')
require_relative('models/product')
require_relative('models/publisher')
also_reload( './models/*' )


get '/products' do
  @products = Product.all
  erb(:index)
end
