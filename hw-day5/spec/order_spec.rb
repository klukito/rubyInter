require './models/order'
require './db/db_connector.rb'

describe Order do
    before(:each) do
        client = create_db_client
        client.query("TRUNCATE TABLE orders")
    end
    describe '#valid?' do
        context 'when initialized with valid input' do
            it 'should return true' do
                order = Order.new({
                    reference_no: "123",
                    customer_name: "Rara Sekar",
                    date: "2020-12-12"
                    })
                expect(order.valid?).to eq(true)
            end
        end
    end
end

# describe Order do
#     before(:each) do
#         client = create_db_client
#         client.query("TRUNCATE TABLE orders")
#     end
#     describe '#save' do
#         context 'when initialized with valid input' do
#             it 'should save to database' do
#                 # Code to test save method
#             end
#         end
#     end
# end

# describe '#create_order' do
#     context 'given valid param' do
#       before(:each) do
    #     ## Prepare the pre-condition (given)
    #     ## Execute the behaviour (when)
#       end

#     it 'should save order' do
#     ## Assert the expectations (then)
#     end

#     it 'render correct view' do
#     ## Assert the expectations (then)
#     end

# end