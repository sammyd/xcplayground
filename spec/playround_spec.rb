require File.expand_path('../spec_helper', __FILE__)

# Tests for Playground
#
module XctimelineFileSpecs
  describe Xcplayground::Playground do
    describe 'Initialisation' do
      it 'sets the path on init' do
        path = 'samplepath'
        playground = Xcplayground::Playground.new(path)
        playground.path.should == path
      end

      it 'creates a contents.swift' do
        playground = Xcplayground::Playground.new('samplepath')
        playground.swift_file.filename.should == 'contents.swift'
      end

      it 'creates a timeline_file' do
        playground = Xcplayground::Playground.new('samplepath')
        playground.timeline_file.should.not.be.nil?
      end

      it 'creates a playground file of the appropriate platform' do
        platform = :osx
        playground = Xcplayground::Playground.new('samplepath', platform)
        playground.playground_file.platform.should == platform
      end

      it 'has a default platform of :ios' do
        playground = Xcplayground::Playground.new('samplepath')
        playground.playground_file.platform.should == :ios
      end

      it 'creates one additional sources file' do
        playground = Xcplayground::Playground.new('samplepath')
        playground.source_files.count.should == 1
      end

      it 'creates an additional source file with the correct filename' do
        playground = Xcplayground::Playground.new('samplepath')
        playground.source_files.first.filename.should == 'SupportCode.swift'
      end
    end
  end
end
