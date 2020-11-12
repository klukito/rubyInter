require './models/item.rb'


class ItemController
    def show_order_form
        renderer = ERB.new(File.read("./views/item_create_temporary.erb"))
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

    def get_item_created(params)
        name = params['name']
        price = params['price']
        category_id = params['category_id']
        item = Item.create_new_item(name, price, category_id)
        redirect '/'

        item.save
        renderer = ERB.new(File.read("./views/item_list.erb"))
        renderer.result(binding)
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

    # #TODO:
    # def edit_item(params)
    #     item = Item.new({
    #         id: params['id']
    #         name: params['name']
    #         price: params['price']
    #         order: self
    #     })

    #     item.edit
    #     item
        
    #     #i think you can just simply update the edit method in item
    #     #so that you can choose a specific item using mysql
    #     #and then edit it
        
    # end

    # #TODO:
    # def delete_item(params)
    #     item = Item.new({
    #         id: params['id']
    #         name: params['name']
    #         price: params['price']
    #         order: self
    #     })

    #     item.delete
    #     item
        
    #     #i think you can just simply update the delete method in item
    #     #so that you can choose a specific item using mysql
    #     #and then delete it

    # end
    
 
end
