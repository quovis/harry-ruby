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
    
    describe "name" do
      before(:each) do
      end
      it('Returns pitch and octave'){ C(1).name.should eq("C") }
      it('Returns flat'){ C(1).flat.name.should eq("Cb") }
      it('Returns sharp'){ C(1).sharp.name.should eq("C#") }
    end

    describe "name_with_octave" do
      before(:each) do
      end
      it('Returns pitch and octave'){ C(1).name_with_octave.should eq("C1") }
      it('Returns flat'){ C(3).flat.name_with_octave.should eq("Cb3") }
      it('Returns sharp'){ C(2).sharp.name_with_octave.should eq("C#2") }
    end
    
    describe "position: " do
      it("returns 0 for C"){ C().position.should eq(0) }
      it("returns 1 for C# and Db"){ C().sharp.position.should eq(1); D().flat.position.should eq(1) }
      it("returns 2 for D"){ D().position.should eq(2); }
      it("returns 3 for D# and Eb"){ D().sharp.position.should eq(3); E().flat.position.should eq(3) }
      it("returns 4 for E"){ E().position.should eq(4) }
      it("returns 5 for F"){ F().position.should eq(5) }
      it("returns 6 for F# and Gb"){ F().sharp.position.should eq(6); G().flat.position.should eq(6) }
      it("returns 7 for G"){ G().position.should eq(7) }
      it("returns 8 for G# and Ab"){ G().sharp.position.should eq(8); A().flat.position.should eq(8) }
      it("returns 9 for A"){ A().position.should eq(9) }
      it("returns 10 for A# and Bb"){ A().sharp.position.should eq(10); B().flat.position.should eq(10) }
      it("returns 11 for B"){ B().position.should eq(11) }
    end
    
    describe "+" do
      context "adding in note without octave" do
        before { @note = C() + 1 }
        it('should return one note more on the chromatic scale'){ @note.name.should eq("C#") }
      end

      context "adding 12 half steps in note without octave" do
        before { @note = C() + 12 }
        it('should return the same value'){ @note.name.should eq("C") }
      end
      
      context "adding one" do
        before { @note = C(1) + 1 }
        it('should return one note more on the chromatic scale'){ @note.name_with_octave.should eq("C#1") }
      end

      context "adding twelve" do
        before { @note = C(1) + 12 }
        it('should increase the octave in one'){ @note.name_with_octave.should eq("C2") }
      end

      context "crossing one octave" do
        before { @note = B(1) + 1 }
        it('should increase the octave in one and return the correct pitch'){ @note.name_with_octave.should eq("C2") }
      end
    end

    describe "-" do
      context "substracting one" do
        before { @note = D(1) - 1 }
        it('should return one note more on the chromatic scale'){ @note.name_with_octave.should eq("C#1") }
      end

      context "adding twelve" do
        before { @note = C(1) - 12 }
        it('should increase the octave in one'){ @note.name_with_octave.should eq("C0") }
      end

      context "crossing one octave" do
        before { @note = C(1) - 1 }
        it('should increase the octave in one and return the correct pitch'){ @note.name_with_octave.should eq("B0") }
      end
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