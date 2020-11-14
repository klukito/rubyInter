require './db/db_connector.rb'
require './models/category.rb'

class Item
    attr_accessor :name,:price, :id,  :category, :description

    def initialize(name, price, id, category=nil, description=nil)
        @name = name
        @price = price
        @id = id
        @category = category
        @description = description
    end

    def save
        return false unless valid?

        self.create_new_item()
    end

    def valid?
        return false if @name.nil?
        return false if @price.nil?
        return false if @category_name.nil?
        true
    end

    def self.create_new_item(name, price, category_id)
        client = create_db_client
        client.query("insert into items(name, price) values('#{name}', '#{price}')")
        client.query("insert into item_categories(item_id, category_id) values(#{client.last_id}, #{category_id})")
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


    #TODO:
    def self.edit(id, name, price, category_id)
        client = create_db_client
        selected_data = client.query("select * from items where id = #{id}")
        if selected_data == nil
            puts("Please insert a valid id")
        else 
            client.query("update items i set i.name = '#{name}', i.price = '#{price}' where id = '#{id}'")
            client.query("update item_categories ic set ic.category_id = '#{category_id}' where item_id = '#{id}'")

            # client.query("UPDATE items i JOIN item_categories ic ON i.id=ic.item_id SET ic.category_id = '#{category_id}', i.name = '#{name}', i.price = '#{price}' where id = '#{id}';
            
            #update items set items.name = 'Es Cendol', items.price = '10000' where id = '7';
            #update item_categories i set i.category_id = '2' where i.item_id = '7'; 
        end
    end

    #TODO:
    def self.delete(id)
        client = create_db_client
        client.query("delete * from items where id = #{id}")
    end
    
end

