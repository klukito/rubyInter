require './models/order.rb'

class OrderController
    def show_order_form
        renderer = ERB.new(File.read("./views/order_create.erb"))
        renderer.result(binding)
    end

    def create_order(params)
        order = Order.new({
            reference_no: params['ref_no']
            customer_name: params['cust_name']
            date: params['date']
        })

        order.save
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)
    end

    #TODO:
    def edit_order(params)
        order = Order.new({
            reference_no: params['ref_no']
            customer_name: params['cust_name']
            date: params['date']
        })

        order.edit
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)
    end

    #TODO:
    def delete_order(params)
        order = Order.new({
            reference_no: params['ref_no']
            customer_name: params['cust_name']
            date: params['date']
        })

        order.save
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)
    end

    def find_by_id(params)
        id = params['id']
        order.find_by_id
    end


    def add_item(params)
        order = Order.find_by_reference_no(params['ref_no'])
        item = order.add_item(params)
        renderer = ERB.new(File.read("./views/item.erb")) #careful with item.erb
        renderer.result(binding)
    end

    def show_add_item_item_for_order_form(params)
        reference_no = params['ref_no'])
        renderer = ERB.new(File.read("./views/item.erb")) #careful with item.erb
        renderer.result(binding)
    end

end
