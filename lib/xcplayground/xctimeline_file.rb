module Xcplayground
  # Represent a .xctimeline file on disc
  class XctimelineFile
    require 'builder'

    attr_reader :version

    def initialize(version = '3.0')
      @version = version
    end

    def save(path)
      puts path
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
