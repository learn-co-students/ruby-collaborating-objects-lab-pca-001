require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  def add_song(song)
    song.artist = self
    @songs << song
  end
  def print_songs
    @songs.each{ |artist| puts artist.name }
  end
  class << self
    def all
      @@all
    end
    def find_or_create_by_name(artist_name)
      artist = all.find{ |artist| artist.name == artist_name }
      unless !!artist
        artist = Artist.new(artist_name)
      end
      artist
    end
  end
end