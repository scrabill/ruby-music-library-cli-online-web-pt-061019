require "pry"
class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    # self.artist = artist
    # @artist = self.artist.name
    @artist = artist
    # self.artist=(artist)
    # toxic.artist=(brit)
  end

  def self.create(name)
    x = self.new(name) # Can this be refactored to not include x?
    x.save
    x
  end

  # binding.pry

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def artist=(artist) # ???
    @artist = artist
    artist.add_song(self)
  end

  # binding.pry

  # Songs belong to an artist and an artist has many songs.
  # Adding a song to an artist is done by calling an
  #add_song method on an instance of the Artist class.

  # def artist=(artist)
  #   @artist = artist
  # end

end
