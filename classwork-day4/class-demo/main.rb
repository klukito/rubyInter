require 'sinatra'
require './controllers/order_controller.rb'
require'./models/item

get '/form/create/order' do
    controller = OrderController.new
    controller.show_create_order_form
end

get '/form/add/item/:ref_no' do
    controller = OrderController.new
    controller.show_add_item_for_order_form(params)
end

post '/item/add/:ref_no' do
    controller = OrderController.new
    controller.show_add_item_for_order_form(params)
end

post '/order' do
   controller = OrderController.new
   controller.find_order(params)
end

get '/order' do
    controller = OrderController.new
    controller.find_order(params)
end

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
