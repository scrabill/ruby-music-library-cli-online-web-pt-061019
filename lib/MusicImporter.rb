class MusicImporter
    
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("#{path}/*.mp3") # glob = global
        files.collect {|file| file.gsub("#{path}/","")} # Remove the .mpg, and the path/folder and split at each hypen
      end

      def import
        files.each do |file|
          file = Song.new_by_filename
        end
    
        # Since we have to send the filenames to the Song class,
        # we'll end up calling the following code in the #import method:
        # Song.new_by_filename(some_filename). This will send us to the Song class, specifically Song.new_by_filename.
      end
end