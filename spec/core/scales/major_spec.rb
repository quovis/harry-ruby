require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Harry::Scales::Major do 
  it("Should be a scale"){ Harry::Scales::Major.new.kind_of?(Harry::Scale).should be_true }

  describe "being instantiated" do
    context "using helper function" do
      before(:all) { @ms = MajorScale D() }

      it("uses D as tonic note") { @ms.tonic.name.should eq("D") }
      it("creates the major scale in D") { @ms.notes.map { |n| n.name }.should eq(["D", "E", "F#", "G", "A", "B", "C#"]) }
    end
  end
end