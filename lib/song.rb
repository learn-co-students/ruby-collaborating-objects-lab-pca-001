require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
  def artist=(arg)
    arg = arg.name if arg.kind_of? Artist
    @artist = Artist.find_or_create_by_name(arg)
  end
  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end
  class << self
    def all
      @@all
    end
    def new_by_filename(file)
      tmp = file.split(" - ")
      song = Song.new(tmp[1])
      artist = Artist.new(tmp[0])
      song.artist = artist
      artist.songs << song
      song
    end
  end
end