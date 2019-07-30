class MusicLibraryController

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def call
        puts "Welcome to your music library!"
    end
end