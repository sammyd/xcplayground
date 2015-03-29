module Xcplayground
  # Represent a Swift language file on disc
  class XcplaygroundFile
    require 'builder'

    attr_accessor :version
    attr_accessor :platform

    def initialize(platform, version = '5.0')
      @platform = platform
      @version  = version
    end

    def save(filepath, timeline_file = 'timeline.xctimeline')
      puts filepath
      puts timeline_file
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
