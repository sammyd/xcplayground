require File.expand_path('../spec_helper', __FILE__)

# Tests for SwiftFile
#
module SwiftFileSpecs
  describe Xcplayground::SwiftFile do
    describe 'Initialisation' do
      it 'sets the content on initialization' do
        content = 'test content'
        swift_file = Xcplayground::SwiftFile.new(content)
        swift_file.content.should == content
      end
    end
  end
end
