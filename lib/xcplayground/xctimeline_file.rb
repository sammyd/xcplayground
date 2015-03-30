module Xcplayground
  # Represent a .xctimeline file on disc
  class XctimelineFile
    require 'builder'

    attr_reader :filename
    attr_reader :version

    def initialize(filename = 'timeline.xctimeline', version = '3.0')
      @filename = filename
      @version  = version
    end

    def save(path)
      file = File.join(path, filename)
      File.open(file, 'w') do |f|
        f.puts to_s
      end
    end

    def to_s
      xml = Builder::XmlMarkup.new(indent: 2)
      xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'
      xml.Timeline(version: version) do |tl|
        tl.TimelineItems {}
      end
      xml.target!
    end
  end
end
