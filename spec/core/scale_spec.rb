require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Scale do 
  describe "instance methods:" do
    describe "parse_intervals" do
      before(:each) do
        @scale = Scale.new
        @intervals = [2,2,1,2,2,2]
        @scale.intervals = @intervals
        @scale.tonic = C()
        @scale.parse_intervals
      end
      it("should update the notes") { @scale.notes.map { |n| n.name }.should eq(["C","D","E","F","G","A","B"]) }
      
    end
  end
  describe "members:" do
    before(:each) { @scale = Scale.new }

    describe "intervals" do
      before(:each) do
        @intervals = [2,2,1,2,2,2]
        @scale.intervals = @intervals
        @scale.tonic = C()
      end
      it("assigns interval") { @scale.intervals.should eq(@intervals) }
    end

    describe "tonic" do
      before(:each) do
        @tonic = C()
        @scale.tonic = @tonic
      end
      it("assigns notes") { @scale.tonic.should eq(@tonic) }
    end

    describe "notes" do
      before(:each) do
        @notes = [C()]
        @scale.notes = @notes
      end
      it("assigns notes") { @scale.notes.should eq(@notes) }
    end
    
  end
end

