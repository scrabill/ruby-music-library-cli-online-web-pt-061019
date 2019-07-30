class Genre
  attr_accessor :name, :song

  extend Concerns::Findable

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

  def artists

    x = []

    self.songs.each do |song|
      x << song.artist
    end

    x.uniq

  end
end
