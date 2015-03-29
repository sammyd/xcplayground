require File.expand_path('../spec_helper', __FILE__)

# Tests for XctimelineFile
#
module XctimelineFileSpecs
  describe Xcplayground::XctimelineFile do
    describe 'Initialisation' do
      it 'sets the version on init' do
        version  = '1.2'
        timeline_file = Xcplayground::XctimelineFile.new(version)
        timeline_file.version.should == version
      end

      it 'defaults to version 3.0 on init' do
        timeline_file = Xcplayground::XctimelineFile.new
        timeline_file.version.should == '3.0'
      end
    end
  end
end
