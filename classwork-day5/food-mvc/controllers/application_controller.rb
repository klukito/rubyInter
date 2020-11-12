require 'erb'

class ApplicationController
    def show
        renderer = ERB.new(File.read("./views/item_list.erb"))
        renderer.result(binding)
    end
end