require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "127.0.0.1",
        :username => "root",
        :password => "12345",
        :database => ENV["db_name"]
    )
    client
end

