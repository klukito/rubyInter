require 'mysql2'
export db_name = order_db
#require './item.rb'
#require './category.rb'

def create_db_client
    client = Mysql2::Client.new(
        :host => "127.0.0.1",
        :username => "root",
        :password => "gR3Ybottle!",
        :database => ENV["db_name"]
    )
    client
end
