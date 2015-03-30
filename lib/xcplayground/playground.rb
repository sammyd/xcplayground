#
module Xcplayground
  # Represents a .playground file
  class Playground
    require 'fileutils'

    attr_accessor :source_files
    attr_reader :path, :timeline_file, :playground_file, :swift_file

    def initialize(path, platform = :ios)
      @path = File.expand_path(path)
      @swift_file      = SwiftFile.new('contents.swift')
      @timeline_file   = XctimelineFile.new
      @playground_file = XcplaygroundFile.new(platform)
      @source_files    = [SwiftFile.new('SupportCode.swift')]
    end

    def save
      # Make the playground container directory
      FileUtils.mkdir_p(path)

      # Save the timeline and playground files
      [timeline_file, playground_file, swift_file].each { |f| f.save(path) }

      # Save the additional source files
      save_sources
    end

    private

    def save_sources
      source_path = File.join(path, 'Sources')
      FileUtils.mkdir_p(source_path)
      source_files.each { |f| f.save(source_path) }
    end
  end
end
