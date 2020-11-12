class WLI
    attr_reader :names

    def initialize(names)
        @names = names
    end
    
    def likes
        if names.count == 0
            "No one likes this"
        elsif names.count == 1
            "#{names} like this"
        elsif names.count <= 4
            "#{names[0..-2].join(', ')} and #{names[-1]} like this"
        else
            "#{names[0..1].join(', ')} and #{names.count - 2} others like this"
        end
    end
end