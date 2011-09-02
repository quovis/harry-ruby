require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Notes" do 
  ["A", "B", "C", "D", "E", "F", "G"].each do |note|
    describe "#{note}" do
      before(:each) do
        @note = send(note, 1)
      end
      it("sets the pitch correctly"){ @note.pitch.should eq(note) }
      it("sets the octave correctly"){ @note.octave.should eq(1) }
    end
  end
end

