# require "pry"
class Song

  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    # @genre = genre

    self.artist = artist if artist # Everything in Ruby is truthy except for nil
    self.genre = genre if genre

    # This also works
    # if artist != nil
    #   self.artist = artist
    # end

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

  def genre=(genre) # ???
    @genre = genre
    # genre.songs << self

    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name}

    # if self.all.include?(name) |song|
    #   song
    # end


    # x = nil
    #
    # self.all.each do |song|
    #   if song.name.include?("name")
    #     x = song
    #   end
    # end
    #
    # x

  end

  def self.find_or_create_by_name(name)

    # self.find_by_name(name) || self.new(name) # ???

    self.find_by_name(name) || self.create(name) # If self.find_by_name(name) is value than do the other thing
    #   self.find_by_name(name)
    #
    # elsif self.find_by_name(name) == nil
    #   self.create(name)
    # else
    #   self.find_by_name(name)
    # end

    # self.find_by_name(name)

    # binding.pry

    # if self.find_by_name(name).name != name
    #   self.new(name)
    # else
    #   self.find_by_name(name)
    # end
    #
    # if self.find_by_name(name) == false
    #   self.new(name)
    # end

    # self.find_by_name(name)


    # it "invokes .find_by_name instead of re-coding the same functionality" do
    #   expect(Song).to receive(:find_by_name).with("Kaohsiung Christmas")
    #
    #   Song.find_or_create_by_name("Kaohsiung Christmas")
    # end
  end

  # def self.new_from_filename(filename)
  #       # binding.pry
  #       x = filename.gsub(".mp3","").split(" - ")
  #       artist = x[0]
  #       name = x[1]
  #       genre = x[2]
  #       song = Song.new(name)
  #       song.name = name
  #       song.genre = genre
  #       song.artist = artist
  #       song
  #     end

  def self.new_from_filename(filename)
    x = filename.gsub(".mp3","").split(" - ")
    artist = x[0]
    name = x[1]
    genre = x[2]
    song = Song.new(name)
    puts song
    # song.name = name
    # song.artist.name = artist
    # song.genre.name = genre
    # song

    # expect(song.name).to eq("For Love I Come")
    # expect(song.artist.name).to eq("Thundercat")
    # expect(song.genre.name).to eq("dance")

  end


end
