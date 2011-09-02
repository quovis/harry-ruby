class Harry::Note
  include Harry::NoteInstance

  def initialize(options = { :pitch => 'A', :octave => '4' })
    self.pitch = options[:pitch]
    self.octave = options[:octave]
  end
end