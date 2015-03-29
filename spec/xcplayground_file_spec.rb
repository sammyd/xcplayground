require File.expand_path('../spec_helper', __FILE__)

# Tests for XcplaygroundFile
#
module XcplaygroundFileSpecs
  describe Xcplayground::XcplaygroundFile do
    describe 'Initialisation' do
      it 'sets the platform and version on init' do
        platform = :osx
        version  = '1.2'
        playground_file = Xcplayground::XcplaygroundFile.new(platform, version)
        playground_file.platform.should.equal platform
        playground_file.version.should == version
      end

      it 'defaults to version 5.0 on init' do
        playground_file = Xcplayground::XcplaygroundFile.new(:ios)
        playground_file.version.should == '5.0'
      end
    end
  end
end
