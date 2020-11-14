require './models/item.rb'
require './models/category.rb'

class ItemController
    def show_order_form
        renderer = ERB.new(File.read("./views/item/create.erb"))
        renderer.result(binding)
    end

    def show_all_items()
        items = Item.get_all_items_with_categories()
        renderer = ERB.new(File.read("./views/item/list.erb"))
        renderer.result(binding)
    end

    def show_all_categories()
        categories = Category.get_all_categories()
        renderer = ERB.new(File.read("./views/category/list.erb"))
        renderer.result(binding)
    end

    def create_item(params)
        item = Item.new({
            id: params['id'],
            name: params['name'],
            price: params['price'],
            order: self
        })

        item.save
        item
    end

    def create_item_with_category(params) 
        categories = Category.get_all_categories() #static/class method
        name = params['name']
        price = params['price']
        category_id = params['category_id']
        erb :create, locals: {
            categories: categories,
            name: name,
            price: price,
            category_id: category_id
        }
    end

    def get_item_created(params)
        name = params['name']
        price = params['price']
        category_name = params['category_name']
        item = Item.create_new_item(name, price, category_name)
        redirect '/'

        item.save
        renderer = ERB.new(File.read("./views/item/list.erb")) #need to change item.erb
        renderer.result(binding)
    end


    #TODO:
    def edit_item(params)
        name = params['name']
        price = params['price']
        category_id = params['category_id']
        erb :edit, locals: {
            name: name,
            price: price,
            category_id: category_id
        }
    
        item.edit
        item
    end

    #TODO:
    def delete_item(params)
        id = params['id']
        erb :delete, locals: {
            id: id
        }

        item.delete
        item
        
        #i think you can just simply update the delete method in item
        #so that you can choose a specific item using mysql
        #and then delete it

    end
    
    def show_order_form
        renderer = ERB.new(File.read("./views/create_item.erb"))
        renderer.result(binding)
    end

    def get_all_categories
        client = create_db_client
        raw_data = client.query("select * from categories")
        categories = Array.new
        raw_data.each do |data|
            category = Category.new(data['name'], data['id'])
            categories.push(category)
        end
        categories
    end

    def create_category(params)
        item = Item.new({
            id: params['id'],
            name: params['name'],
            price: params['price'],
            order: self
        })

        category.save
        item
    end

    def get_category_created(params)
        name = params['name']
        id = params['id']
        category = Category.create_new_item(name, id)
        redirect '/'

        category.save
        renderer = ERB.new(File.read("./views/category/info.erb")) #need to change item.erb
        renderer.result(binding)
    end

    #TODO:
    def edit_category(params)
        name = params['name']
        id = params['id']
        erb :edit, locals: {
            name: name,
            id: id
        }
    
        category.edit
        category
    end

    #TODO:
    def delete_category(params)
        id = params['id']
        erb :delete, locals: {
            id: id
        }

        category.delete
        category
        
        #i think you can just simply update the delete method in item
        #so that you can choose a specific item using mysql
        #and then delete it

    end
    
    
 
end
