class Genre
  attr_accessor :name

  @@all = {}

  def initialize(name)
    @name = name
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
end
