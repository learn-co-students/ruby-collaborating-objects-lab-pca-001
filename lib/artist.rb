class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(artist_name)
    all.find { |artist| artist.name == artist_name } || new(artist_name)
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end
end