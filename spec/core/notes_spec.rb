require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Notes" do 
  ["A", "B", "C", "D", "E", "F", "G"].each do |note|
    describe "#{note}" do
      before(:each) do
        @note_class = Object.module_eval(note)
        @note = @note_class.new
      end
      it("sets the pitch correctly"){ @note.send("pitch").should eq(note) }
    end
  end
end