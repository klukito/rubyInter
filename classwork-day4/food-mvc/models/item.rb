require './db/db_connector.rb'
require './models/category.rb'

class Item
    attr_accessor :name,:price, :id, :category
    def initialize(name, price, id, category=nil)
        @name = name
        @price = price
        @id = id
        @category = category
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("insert into items(name, price) values('#{name}', '#{price}')")
        client.query("select categories.id from categories where name = '#{category_name}'")
        #tinggal connect category_name sama category_id 
    #     #client.query("insert into item_categories(item_id, category_id) values(#{client.last_id}, #{category_id})")
    end

    def valid?
        return false if @name.nil?
        return false if @price.nil?
        return false if @category_name.nil?
        true
    end

    def self.get_all_items
        client = create_db_client
        raw_data = client.query("SELECT * from items")
        items = Array.new
        raw_data.each do |data|
            item = Item.new(data['name'], data['price'], data['id'])
            items.push(item)
        end
    
        items
    end

    def self.get_all_items_with_categories
        client = create_db_client
        raw_data = client.query(
            "select items.id, 
            items.name, 
            items.price,
            categories.name as category_name, 
            categories.id as category_id 
            from items join item_categories on items.id = item_categories.item_id
            join categories on item_categories.category_id = categories.id
            ")
        items = Array.new
        raw_data.each do |data|
            category = Category.new(data["category_name"], data["category_id"])
            item = Item.new(data['name'], data['price'], data['id'], category)
            items.push(item)
        end
        puts items
        items
    end

    # def self.create_new_item(name, price, category_name)
    #     client = create_db_client
    #     client.query("insert into items(name, price) values('#{name}', '#{price}')")
    #     client.query("select categories.id from categories where name = '#{category_name}")
    #     #tinggal connect category_name sama category_id 
    #     #client.query("insert into item_categories(item_id, category_id) values(#{client.last_id}, #{category_id})")
        
    # end

    
end

