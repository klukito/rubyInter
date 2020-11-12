require 'mysql_connector.rb'
require './model/item.rb'

class Order
    attr_accessor :reference_no, :customer_name, :date, :items

    #create table `orders` (
    #    `reference_no` varchar(255) not null,
    #    `customer_name` varchar(255) not null,
    #    `date` varchar(255) not null,
    #    primary key (`referece_no`)
    #);
    
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
            id: params['id']
            name: params['name']
            price: params['price']
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

