class Song
  attr_accessor :name, :artist, :artist_name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    a = file.split(" - ")
    song = new(a[1])
    artist = Artist.find_or_create_by_name(a[0])
    song.artist = artist
    song.artist.songs << song
    song
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    self.artist = artist
  end
end