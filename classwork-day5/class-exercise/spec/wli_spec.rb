require './wli.rb'

describe WLI do
    it "no name" do
        wli = WLI.new([])
        likes = wli.likes
        expect(likes).to eq("No one likes this")
    end

    it "more than 1" do
        wli = WLI.new(["John", "Jade", "Alex"])
        likes = wli.likes
        expect(likes).to eq("John, Jade and Alex like this")
    end

    it "more than 4" do
        wli = WLI.new(["John", "Jade", "James", "Alex", "Amy"])
        likes = wli.likes
        expect(likes).to eq("John, Jade and 3 others like this")
    end
end