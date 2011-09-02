module Harry
  ["A", "B", "C", "D", "E", "F", "G"].each do |pitch|
    send(:define_method, pitch.to_sym) do |octave|
      Note.new({:pitch => pitch, :octave => octave})
    end
  end
end
