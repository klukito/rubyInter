require 'mysql2'
require './item.rb'
require './category.rb'

def create_db_client
    client = Mysql2::Client.new(
        :host => "127.0.0.1",
        :username => "root",
        :password => "123123",
        :database => "food_oms_db"
    )
    client
end

def get_all_items
    client = create_db_client
    raw_data = client.query("SELECT * from items")
    items = Array.new
    raw_data.each do |data|
        item = Item.new(data['name'], data['price'], data['id'])
        items.push(item)
    end

    items
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

def get_all_items_with_categories
    client = create_db_client
    raw_data = client.query(
        "select items.id, 
        items.name, 
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

    items
end

def create_new_item(name, price, category_id)
    client = create_db_client
    client.query("insert into items(name, price) values('#{name}', '#{price}')")
    client.query("insert into item_categories(item_id, category_id) 
                select id , #{category_id}
                from items where name = '#{name}'
    ")
end
