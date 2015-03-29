module Xcplayground
  # Represent a Swift language file on disc
  class SwiftFile
    attr_accessor :content

    def initialize(content)
      @content = content
    end

    def save(filepath)
      puts filepath
    end

    def to_s
      @content
    end
  end
end
