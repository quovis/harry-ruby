require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sequencer do
  context "being instantiated" do
    context "with 120bpm" do
      before(:each) do
        @seq = Sequencer.bpm(120)
      end
      it("should set the bpm to 120"){ @seq.bpm.should eq(120)}
    end

    context "initiated with 4x4 for time signature" do
      before(:each) do
        @seq = Sequencer.time_signature("4x4")
      end
      
      it("should set time signature to 4x4"){ @seq.time_signature.should eq("4x4")}
    end
  end
  
  describe "instances" do
  end
  
  
end
