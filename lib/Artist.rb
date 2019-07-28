class Artist
  attr_accessor :name

  @@all = {}

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    x = self.new(name) # Can this be refactored to not include x?
    x.save
    x
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if self.songs.include?(song) == false
      @songs << song
    end
  end
end
