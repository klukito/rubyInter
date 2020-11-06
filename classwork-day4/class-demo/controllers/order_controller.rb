require './models/order.rb'

class OrderController
    def show_order_form
        renderer = ERB.new(File.read("./views/create_order.erb"))
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

    def find_by_id(params)
        id = params['id']
        order.find_by_id
    end
end
