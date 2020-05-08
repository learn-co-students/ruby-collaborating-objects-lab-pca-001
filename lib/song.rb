
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)

  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    artist_song = self.new(song)
    artist_song.artist_name = artist
    artist_song
  end


end