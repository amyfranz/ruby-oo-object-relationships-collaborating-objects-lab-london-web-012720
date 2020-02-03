require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize(list_of_filenames)
        @path = list_of_filenames
    end

    def files 
        file_names = Pathname(@path).glob("*.mp3")
        file_names = file_names.map{|file_name|file_name.basename.to_s}
    end

    def import 
        files.map{|file|Song.new_by_filename(file)}
    end
end