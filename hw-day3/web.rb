require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items_with_categories()
    erb :list_item, locals: {
        items: items
    }
end

get '/items/create' do 
    categories = get_all_categories()
    erb :create, locals: {
        categories: categories
    }
end

post '/items/create' do
    name = params['name']
    price = params['price']
    category_id = params['category_id']
    create_new_item(name, price, category_id)
    redirect '/'
end


