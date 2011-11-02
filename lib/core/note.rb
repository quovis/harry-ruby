module Harry
  class Note
    include NoteInstance

    def initialize(options = { :pitch => nil, :octave => nil })
      self.pitch = options[:pitch]
      self.octave = options[:octave]
    end
  end

  # Define functions to use NOTE(octave) syntax
  # Use this to instantiate a note.
  # Ex: C(1)
  ["A", "B", "C", "D", "E", "F", "G"].each do |pitch|
    send(:define_method, pitch.to_sym) do |*args|
      Note.new({:pitch => pitch, :octave => args[0]})
    end
  end
  
  def silence
    Note.new
  end
end
