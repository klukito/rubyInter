require './models/item'
require './db/db_connector.rb'

describe Item do
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
