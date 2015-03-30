module Xcplayground
  # Represent a Swift language file on disc
  class XcplaygroundFile
    require 'builder'

    attr_accessor :version
    attr_accessor :platform
    attr_accessor :filename

    def initialize(platform, fname = 'contents.xcplayground', version = '5.0')
      @platform = platform
      @filename = fname
      @version  = version
    end

    def save(path, timeline_file = 'timeline.xctimeline')
      file = File.join(path, filename)
      File.open(file, 'w') do |f|
        f.puts to_s(timeline_file)
      end
    end

    def to_s(timeline_file)
      xml = Builder::XmlMarkup.new(indent: 2)
      xml.instruct! :xml, version: '1.0', encoding: 'UTF-8', standalone: 'yes'
      xml.playground(version: version, 'target-platform' => platform) do |p|
        p.timeline(fileName: timeline_file)
      end
      xml.target!
    end
  end
end
