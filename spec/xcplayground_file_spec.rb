require File.expand_path('../spec_helper', __FILE__)

# Tests for XcplaygroundFile
#
module XcplaygroundFileSpecs
  describe Xcplayground::XcplaygroundFile do
    describe 'Initialisation' do
      it 'sets the platform, filename and version on init' do
        platform = :osx
        fname = 'samplefilename'
        v  = '1.2'
        playground_file = Xcplayground::XcplaygroundFile.new(platform, fname, v)
        playground_file.platform.should.equal platform
        playground_file.filename.should.equal fname
        playground_file.version.should == v
      end

      it 'defaults to version 5.0 on init' do
        playground_file = Xcplayground::XcplaygroundFile.new(:ios)
        playground_file.version.should == '5.0'
      end

      it 'has a default filename' do
        playground_file = Xcplayground::XcplaygroundFile.new(:ios)
        playground_file.filename.should == 'contents.xcplayground'
      end
    end
  end
end
