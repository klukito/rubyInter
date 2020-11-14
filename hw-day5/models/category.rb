require './db/db_connector.rb'

class Category
    attr_accessor :name, :id

    def initialize(name, id)
        @id = id
        @name = name
        @items = []
    end

    def valid?
        return false if @name.nil?
    end

    def self.get_category(id)
        client = create_db_client
        raw_data = client.query("select * from categories where id = #{id}")
        category = raw_data.to_a
    
        category
    end

    def self.get_all_categories
        client = create_db_client
        raw_data = client.query("select * from categories")
        categories = Array.new
        raw_data.each do |data|
            category = Category.new(data['name'], data['id'])
            categories.push(category)
        end
        
        categories
    end

    def self.save
        # return false unless valid?
        client = create_db_client
        client.query("insert into categories (name) values ('#{name}')")
    end

    def self.edit(id, name)
        client = create_db_client
        selected_data = client.query("select * from categories where id = #{id}")
        if selected_data == nil
            puts("Please insert a valid id")
        else 
            client.query("update categories set name = '#{name}' where id = #{id} ")
        end
    end

    def self.delete(id)
        client = create_db_client
        client.query("delete * from categories where id = #{id}")

        # record = self.get_category(id)
        
        # record.empty?
    end

end