require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Dummy
  include NoteInstance
end

describe NoteInstance do 
  #####################################################################
  # Instance Methods
  #####################################################################
  describe "instance methods" do
    before(:each) { @note = Dummy.new }
    [
      'longa', 'doublewhole', 'whole', 'half', 
      'quarter', 'eighth', 'sixteenth', 'thirty-second', 
      'sixty-fourth', 'hundred-twenty-eighth'
    ].each do |value|
      describe value do
        before(:each) { @result = @note.send(value) }
        it("sets value to #{value}") { @note.value.should eq(value) }
        it("returns the object") { @result.should eq(@note) }
      end
    end

    [ 'flat', 'normal', 'sharp' ].each do |value|
      describe value do
        before(:each) { @result = @note.send(value) }
        it("sets accidental to #{value}") { @note.accidental.should eq(value) }
        it("returns the object") { @result.should eq(@note) }
      end
    end
    
    # Dots
    describe "dots" do
      before(:each) { @result = @note.dots(1) }
      it("sets dots to 1") { @note.dots.should eq(1) }
      it("returns the object") { @result.should eq(@note) }
    end
    
  end

  #####################################################################
  # Class Methods
  #####################################################################
  describe "class methods" do

    # Value (duration)
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
    
    # Accidental
    [ 'flat', 'normal', 'sharp' ].each do |value|
      describe value do
        before(:each) { @note = Dummy.send(value) }
        it("sets accidental to #{value}") { @note.accidental.should eq(value) }
      end
    end
    
    # Dots
    describe "dots" do
      before(:each) { @note = Dummy.dots(1) }
      it("sets dots to 1") { @note.dots.should eq(1) }
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