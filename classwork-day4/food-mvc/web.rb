require 'sinatra'
require './models/category.rb'
require './models/item.rb'
require './controllers/order_controller.rb'
require './controllers/item_controller.rb'

get '/items/list' do
    items = Item.get_all_items_with_categories()
    categories = Category.get_all_categories()
    erb :list_item, locals: {
        items: items,
        categories: categories
    }
end

get '/orders/list' do
    items = Item.get_all_items_with_categories()
    categories = Category.get_all_categories()
    erb :list_item, locals: {
        items: items,
        categories: categories
    }
end

post '/order/create' do
    controller = OrderController.new
    controller.create_order(params)
 end
 
 get '/order/find' do
     controller = OrderController.new
     controller.find_order(params)
 end

get '/items/create' do 
    categories = Category.get_all_categories() #static/class method
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
    Item.create_new_item(name, price, category_name)
    redirect '/'
end

# get '/form/create/order' do
#     controller = OrderController.new
#     controller.show_create_order_form(params)
# end

# get '/form/add/item/:ref_no' do
#     controller = OrderController.new
#     controller.show_add_item_for_order_form(params)
# end

# post '/item/add/:ref_no' do
#     controller = OrderController.new
#     controller.show_add_item_for_order_form(params)
# end

# post '/order' do
#    controller = OrderController.new
#    controller.create_order(params)
# end

# get '/order' do
#     controller = OrderController.new
#     controller.find_order(params)
# end


get '/order/edit/:ref_no' do
    controller = OrderController.new
    controller.edit_order(params)
end

get '/order/delete/:ref_no' do
    controller = OrderController.new
    controller.delete_order(params)
end

get '/order/:id' do
    controller = OrderController.new
    controller.find_by_id(params)
end
