require './db/db_connector.rb'

class Category
    attr_accessor :name, :id
    def initialize(name, id)
        @id = id
        @name = name
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
end