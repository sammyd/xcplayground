module Xcplayground
  # Represent a Swift language file on disc
  class SwiftFile
    attr_accessor :content
    attr_accessor :filename

    def initialize(filename, content = nil)
      @filename = filename
      @content  = content
    end

    def save(path)
      file = File.join(path, filename)
      File.open(file, 'w') do |f|
        f.puts to_s
      end
    end

    def to_s
      @content || '//: Playground - noun: a place where people can play'
    end
  end
end
