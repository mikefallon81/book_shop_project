require('sinatra')
require('sinatra/contrib/all')
require_relative('models/author')
require_relative('models/genre')
require_relative('models/product')
require_relative('models/publisher')
also_reload( './models/*' )



get '/' do
  @products = Product.all
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:"products/index")
end

#erb(:"folder_name/filename")
#*******PRODUCTS**********

#INDEX
get '/products' do
  @products = Product.all
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:"products/index")
end

#CREATE
get '/products/new' do
  @product = Product.all
  @genre = Genre.all
  @author = Author.all
  @publisher = Publisher.all
  erb(:"products/new")
end

post '/products' do
  Product.new(params).save
  redirect to '/products'
end

get '/products/:id' do
  @product = Product.find(params[:id])
  @publisher = Publisher.all
  @author = Author.all
  @genre = Genre.all
  erb(:"products/show")
end

post '/products/:id/delete' do
  product = Product.find(params['id'])
  product.delete
  redirect to '/products'
end

get '/products/:id/edit' do
  @publisher = Publisher.all
  @author = Author.all
  @genre = Genre.all
  @product = Product.find(params['id'])
  erb(:"products/edit")
end

post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/products/#{params['id']}"
end

post '/products/:id/add' do
  product = Product.find(params['id'].to_i)
  product.stock_increase(params['order_amount'].to_i)
  redirect to "/stock_warning"
end

post '/publisher/filter' do
  @publisher = Product.filter_by_publisher(params['publisher_id'])
  erb(:"products/filter_publisher")
end

post '/authors/filter' do
  @author = Product.filter_by_author(params['author_id'])
  erb(:"products/filter_author")
end

post '/genres/filter' do
  @genre = Product.filter_by_genre(params['genre_id'])
  erb(:"products/filter_genre")
end


#*******PUBLISHER**********

get '/publisher' do
  @publisher = Publisher.all
  erb(:"publishers/index")
end

get '/publisher/new' do
  @publisher = Publisher.all
  erb(:"publishers/new")
end

post '/publisher' do
  Publisher.new(params).save
  redirect to '/publisher'
end

post '/publisher/:id/delete' do
  publisher = Publisher.find(params['id'])
  publisher.delete
  redirect to '/publisher'
end

get '/publisher/:id/edit' do
  @publisher = Publisher.find(params['id'])
  erb(:"publishers/edit")
end



post '/publisher/:id' do
  publisher = Publisher.new(params)
  publisher.update
  redirect to "/publisher"
end



#*******AUTHOR**********

get '/author' do
  @authors = Author.all
  erb(:"authors/index")
end

get '/author/new' do
  @author = Author.all
  erb(:"authors/new")
end

post '/author' do
  author = Author.new(params).save
  redirect to '/author'
end

post '/author/:id/delete' do
  author = Author.find(params['id'])
  author.delete
  redirect to '/author'
end

get '/author/:id/edit' do
  @author = Author.find(params['id'])
  erb(:"authors/edit")
end



post '/author/:id' do
  author = Author.new(params)
  author.update
  redirect to "/author"
end




#*******GENRES**********

get '/genres' do
  @genres = Genre.all
  erb(:"genres/index")
end

post '/genres/:id/delete' do
  genre = Genre.find(params['id'])
  genre.delete
  redirect to '/genres'
end

get '/genres/new' do
  @genre = Genre.all
  erb(:"genres/new")
end

post '/genres' do
  Genre.new(params).save
  redirect to '/genres'
end

get '/genres/:id/edit' do
  @genre = Genre.find(params['id'])
  erb(:"genres/edit")
end



post '/genres/:id' do
  genre = Genre.new(params)
  genre.update
  redirect to "/genres"
end


#*******STOCK LEVELS**********
get '/stock_warning' do
  @product = Product.low_stock_warning
  @product1 = Product.no_stock_warning
  erb(:"stock_warnings/index")
end
