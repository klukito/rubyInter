require './controllers/application_controller'

describe ApplicationController do
    describe '#show' do
        it 'should show index page' do
            controller = ApplicationController.new
            response = controller.show
            expected_view = ERB.new(File.read("./views/item_list.erb"))
            expect(response).to eq(expected_view.result)
        end
    end
end