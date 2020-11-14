require './controllers/item_controller'
require './models/item'
require './db/db_connector.rb'

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

    describe '#save' do
        context 'when initialized with valid input' do
            it 'should save new item' do
                item = Item.new(
                    "Nasi Goreng Gila",
                    "25000",
                    "main dish"
                    )
                expect(item.valid?).to eq(true)
            end
        end
    end

    # describe '.get_all_items' do
    #     context 'when initialized with valid input' do
    #         it 'should return array of all items' do
    #             item = Item.new({
    #                 name: "Nasi Goreng Gila",
    #                 price: "25000",
    #                 id: "1"
    #                 })
    #             expect(item.valid?).to eq(true)
    #         end
    #     end
    # end
end