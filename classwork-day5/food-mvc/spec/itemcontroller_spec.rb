require './controllers/item_controller'

describe ItemController do
    describe '#show_order_form' do
        it 'should show order form' do
            controller = ItemController.new
            response = controller.show_order_form
            expected_view = ERB.new(File.read("./views/item_create_temporary.erb"))
            expect(response).to eq(expected_view.result)
        end
    end

    describe '#get_item_created' do
        before(:each) do
            client = create_db_client
            client.query("TRUNCATE TABLE items")
        end
        context 'when initialized with valid input' do
            it 'should get items created' do
                controller = ItemController.new
                response = controller.get_item_created
                expected_view = ERB.new(File.read("./views/item_list.erb"))
                expect(response).to eq(expected_view)
            end
        end
    end
end