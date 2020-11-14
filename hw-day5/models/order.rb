require './db/db_connector.rb'
require './models/item.rb'

class Order
    attr_accessor :reference_no, :customer_name, :date, :items

    def initialize(param)
        @reference_no = param[ :reference_no]
        @customer_name = param[ :customer_name]
        @date = param[ :date]
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("insert into orders(reference_no, customer_name, date) values('#{reference_no}', '#{customer_name}'), '#{date}')")
    end

    def self.edit(id, name, price, category_id)
        client = create_db_client
        selected_data = client.query("select * from items where id = #{id}")
        if selected_data == nil
            puts("Please insert a valid id")
        else 
            client.query("update items i set i.name = '#{name}', i.price = '#{price}' where id = '#{id}'")
            client.query("update item_categories ic set ic.category_id = '#{category_id}' where item_id = '#{id}'")

            # client.query("UPDATE items i join item_categories ic ON i.id=ic.item_id SET ic.category_id = '#{category_id}', i.name = '#{name}', i.price = '#{price}' where id = '#{id}';
            
            
            #update items set items.name = 'Es Cendol', items.price = '10000' where id = '7';
            #update item_categories i set i.category_id = '2' where i.item_id = '7'; 
        end
    end

    #TODO:
    def edit
        return false unless valid?

        client = create_db_client
        #edit based on reference number
        client.query("select from ...")
        client.query("insert into orders(reference_no, customer_name, date) values('#{reference_no}', '#{customer_name}'), '#{date}')")
    end

    #TODO:
    def delete
        return false unless valid?

        client = create_db_client
        #delete based on reference number
        client.query("delete orders.id from orders where reference_no = #{reference_no}")
    end

    #TODO
    def find_by_reference_no
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

    def self.find_with_items(a_reference_no)
        order = find_by_reference_no(a_reference_no)
        order.items = Item.find_by_reference_no(a_reference_no)
        order
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false if @date.nil?
        true
    end
end

