require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items_with_categories()
    categories = get_all_categories()
    erb :list_item, locals: {
        items: items,
        categories: categories
    }
end

get '/items/create' do 
    categories = get_all_categories()
    name = params['name']
    price = params['price']
    category_name = params['category_name']
    erb :create, locals: {
        categories: categories,
        name: name,
        price: price,
        category_name: category_name
    }
end


post '/items/create' do
    name = params['name']
    price = params['price']
    category_name = params['category_name']
    create_new_item(name, price, category_name)
    redirect '/'
end


 


