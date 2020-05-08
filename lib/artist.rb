class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def self.all
    @@all
  end

  def self.find_by_name(artist_name)
    @@all.detect do |artist|
      artist.name == artist_name
    end
  end

  def self.find_or_create_by_name(artist)
    find_by_name(artist) || self.new(artist)
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end