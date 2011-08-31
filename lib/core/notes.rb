["A", "B", "C", "D", "E", "F", "G"].each do |pitch|
  # Create the class
  klass = Object.const_set(pitch, Class.new)
  
  # Include Note module
  klass.send(:include, Note)
  
  # Set the pitch
  klass.send(:define_method, "initialize") do
    self.pitch = pitch
  end
end