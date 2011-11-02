require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Harry::Note do 
  describe "instance methods:" do
    describe "#initialize" do
      before(:each) { @note = Note.new(:pitch => 'C', :octave => 3) }
      it('shuld set pitch correctly') { @note.pitch.should eq('C') }
      it('shuld set octave correctly') { @note.octave.should eq(3) }
    end
  end
  
  describe "NOTE(octave) constructors:" do 
    ["A", "B", "C", "D", "E", "F", "G"].each do |note|
      describe "#{note}()" do
        before(:each) do
          @note = send(note, 1)
        end
        it("sets the pitch correctly"){ @note.pitch.should eq(note) }
        it("sets the octave correctly"){ @note.octave.should eq(1) }
      end
    end
  end
  
  describe "Silence" do
    it("is a note") { silence.class.should eq(Note) }
    it("has no pitch") { silence.pitch.should eq(nil) }
    it("has no octave") { silence.octave.should eq(nil) }
  end
end

