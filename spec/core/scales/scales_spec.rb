require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Scales" do 
  {
    "Major" => [2,2,1,2,2,2],
    "NaturalMinor" => [2,1,2,2,1,2],
    "HarmonicMinor" => [2,1,2,2,1,3],
    "HungarianMinor" => [2,1,3,1,1,3],
    "GypsyMinor" => [2,1,3,1,1,2],
  }.each_pair do |key, value|
    it("should be a scale") do
      @class = Object.module_eval("Harry::Scales::#{key}")
      @class.new(:tonic => C()).kind_of?(Harry::Scale).should be_true
    end

    
    describe "being instantiated" do
      context "using helper function" do
        before(:all) { @ms = Object.send("#{key}Scale",D()) }
    
        it("uses D as tonic note") { @ms.tonic.name.should eq("D") }
        it("sets its intervals") { @ms.intervals.should eq(value) }
      end
    end
  end
end