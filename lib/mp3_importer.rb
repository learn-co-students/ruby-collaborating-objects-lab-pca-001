require "pry"
class MP3Importer
  attr_accessor :path

  def initialize path
    @path = path
    @files = []
  end

  def files
    Dir.children(@path)
  end

  def import
    files.each do |filename|
      Song.new_by_filename filename
    end
  end
end
