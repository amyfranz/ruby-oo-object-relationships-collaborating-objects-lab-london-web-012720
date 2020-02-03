class Artist
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name= (name)
        @name = name
    end

    def self.all
        @@all
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

    def add_song(song)
        song.artist = self 
    end 
    
    def songs
        Song.all.select { |song| song.artist == self}
    end 

    def self.find(name)
        self.all.find { |artist| artist.name == name}
    end 
    
    def self.find_or_create_by_name(name)
       if self.all.find { |artist| artist.name == name}
       self.all.find { |artist| artist.name == name}
       else 
        self.new(name)
       end 
    end 
end