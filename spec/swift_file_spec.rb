require File.expand_path('../spec_helper', __FILE__)

# Tests for SwiftFile
#
module SwiftFileSpecs
  describe Xcplayground::SwiftFile do
    describe 'Initialisation' do
      it 'sets the filename on initialization' do
        filename = 'testfile'
        swift_file = Xcplayground::SwiftFile.new(filename)
        swift_file.filename.should == filename
      end

      it 'allows override of the content' do
        content = 'sample content'
        swift_file = Xcplayground::SwiftFile.new('file', content)
        swift_file.content.should == content
      end

      it 'has a default content of nil' do
        swift_file = Xcplayground::SwiftFile.new('file')
        swift_file.content.should.be.nil?
      end
    end

    describe 'default' do
      it 'should specify default content' do
        swift_file = Xcplayground::SwiftFile.new('file')
        default_content = '//: Playground - noun: a place where people can play'
        swift_file.to_s.should == default_content
      end
    end
  end
end
