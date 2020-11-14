require './models/category.rb'


class CategoryController
    def show_order_form
        renderer = ERB.new(File.read("./views/create_item.erb"))
        renderer.result(binding)
    end

    def create_category(params)
        item = Item.new({
            id: params['id']
            name: params['name']
            price: params['price']
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