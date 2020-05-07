class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def artist_name
    @artist ? @artist.name : nil
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name name
  end

  def self.new_by_filename(filename)

    parse = /^(.*)\s\-\s(.*)\s\-\s(.*)\./.match(filename).captures
    artist = parse[0]
    song_name = parse[1]

    song = new(song_name)
    song.artist_name = artist
    song
  end
end
