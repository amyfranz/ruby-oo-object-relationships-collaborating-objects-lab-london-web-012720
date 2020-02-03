class Song
    @@all = []
    attr_accessor :name, :artist
    def initialize(name)
          @name = name
          @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ") #splitting the file
        new_song = self.new(song) #creating new song from the string file we split
        new_song.artist_name = artist #adding the song to an artist 
        new_song #creates new song 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end 
end