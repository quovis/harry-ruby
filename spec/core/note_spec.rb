require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Harry::Note do 
  describe "instance methods:" do
    describe "#initialize" do
      before(:each) { @note = Note.new(:pitch => 'C', :octave => 3) }
      it('shuld set pitch correctly') { @note.pitch.should eq('C') }
      it('shuld set octave correctly') { @note.octave.should eq(3) }
    end
  end
end

