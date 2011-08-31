require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sequencer do
  context "being instantiated" do
    context "with 120bpm" do
      before(:each) do
        @seq = Sequencer.bpm(120)
      end
      it("should set the bpm to 120"){ @seq.bpm.should eq(120)}
    end

    context "with 4x4 for time signature" do
      before(:each) do
        @seq = Sequencer.time_signature("4x4")
      end
      
      it("should set time signature to 4x4"){ @seq.time_signature.should eq("4x4")}
    end
  end
  
  describe "instance methods:" do
    before(:each) do
      @seq = Sequencer.new
    end
    
    describe "#bpm" do
      context "as getter" do
        it("returns bpm") { @seq.bpm.should eq(120) }
      end
      
      context "as setter" do
        before(:each) { @seq1 = @seq.bpm(180) }
        it("returns the sequencer") { @seq1.should eq(@seq) }
        it("sets bpm correctly") { @seq1.bpm.should eq(180) }
      end
      
    end

    describe "#time_signature" do
      context "as getter" do
        it("returns time signature") { @seq.time_signature.should eq("4x4") }
      end

      context "as setter" do
        before(:each) { @seq1 = @seq.time_signature("6x4") }
        it("returns the sequencer") { @seq1.should eq(@seq) }
        it("sets time signature correctly") { @seq1.time_signature.should eq("6x4") }
      end
    end
  end
  
  
end
