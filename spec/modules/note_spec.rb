require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Dummy
  include Note
end

describe Note do 
  describe "members" do
    before(:each) do
      @note = Dummy.new
    end

    [
      { :name => "pitch", :value => "C" },
      { :name => "octave", :value => 1 },
      { :name => "accidental", :value => '#' },
      { :name => "dotted", :value => true },
      
    ].each do |member|
      describe member[:name] do
        before(:each) do
          @note.send("#{member[:name]}=", member[:value])
        end
        it("gets and sets #{member[:name]} correctly"){ @note.send("#{member[:name]}").should eq(member[:value]) }
      end
    end

  end
end