class Artist
  attr_accessor :name, :genre

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

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if self.songs.include?(song) == false
      @songs << song
    end
  end

  def genres

    x = []

    self.songs.each do |song|
      x << song.genre
    end

    x.uniq

  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
