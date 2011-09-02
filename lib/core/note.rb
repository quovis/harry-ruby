module Harry
  class Note
    include NoteInstance

    def initialize(options = { :pitch => 'A', :octave => '4' })
      self.pitch = options[:pitch]
      self.octave = options[:octave]
    end
  end

  # Define functions to use NOTE(octave) syntax
  # Use this to instantiate a note.
  # Ex: C(1)
  ["A", "B", "C", "D", "E", "F", "G"].each do |pitch|
    send(:define_method, pitch.to_sym) do |octave|
      Note.new({:pitch => pitch, :octave => octave})
    end
  end
end