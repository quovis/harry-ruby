require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Dummy
  include Note
end

describe Note do 

  describe "instance methods" do
    before(:each) { @note = Dummy.new }
    [
      'longa', 'doublewhole', 'whole', 'half', 
      'quarter', 'eighth', 'sixteenth', 'thirty-second', 
      'sixty-fourth', 'hundred-twenty-eighth'
    ].each do |value|
      describe value do
        before(:each) { @note.send(value) }
        it("sets value to #{value}") { @note.value.should eq(value) }
      end
    end
  end

  describe "class methods" do
    [
      'longa', 'doublewhole', 'whole', 'half', 
      'quarter', 'eighth', 'sixteenth', 'thirty-second', 
      'sixty-fourth', 'hundred-twenty-eighth'
    ].each do |value|
      describe value do
        before(:each) { @note = Dummy.send(value) }
        it("sets value to #{value}") { @note.value.should eq(value) }
      end
    end
  end
  
  describe "members" do
    before(:each) do
      @note = Dummy.new
    end

    [
      { :name => "pitch", :value => "C" },
      { :name => "octave", :value => 1 },
      { :name => "accidental", :value => '#' },
      { :name => "dotted", :value => true },
      { :name => "value", :value => 'quarter' },
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