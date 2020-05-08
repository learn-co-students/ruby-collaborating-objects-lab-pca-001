class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
    @files = Dir.entries(@path).select do |filename|
        !File.directory? filename

     end
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end

end

