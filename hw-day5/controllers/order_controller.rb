require './models/order.rb'

class OrderController
    def self.show_order_form
        renderer = ERB.new(File.read("./views/order_create.erb"))
        renderer.result(binding)
    end

    def self.create_order(params)
        order = Order.new({
            reference_no: params['ref_no'],
            customer_name: params['cust_name'],
            date: params['date']
        })

        order.save
        renderer = ERB.new(File.read("./views/order.erb"))
        renderer.result(binding)
    end

    #TODO:
    
    def self.edit_order(params)
        reference_no = params['ref_no']
        cusomer_name = params['cust_name']
        date = params['date']
        erb :edit, locals: {
            ref_no: ref_no,
            customer_name: customer_name,
            date: date
        }

        order.edit
        renderer = ERB.new(File.read("./views/order/order_edit.erb"))
        renderer.result(binding)
    end

    #TODO:
    def self.delete_order(params)
        reference_no = params['ref_no']
        erb :delete, locals: {
            ref_no: ref_no
        }
    
        order.delete
        renderer = ERB.new(File.read("./views/order/order_list.erb"))
        renderer.result(binding)
    end

    def self.find_by_id(params)
        id = params['id']
        order.find_by_id
    end


    def self.add_item(params)
        order = Order.find_by_reference_no(params['ref_no'])
        item = order.add_item(params)
        renderer = ERB.new(File.read("./views/item.erb")) #careful with item.erb
        renderer.result(binding)
    end

    def self.show_add_item_for_order_form(params)
        reference_no = params['ref_no']
        renderer = ERB.new(File.read("./views/item.erb")) #careful with item.erb
        renderer.result(binding)
    end

end
