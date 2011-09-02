module Harry::NoteInstance
  #####################################################################
  # Attributes
  #####################################################################
  attr_accessor :pitch, :octave, :accidental, :value

  #####################################################################
  # Instance Methods
  #####################################################################

  # Value (duration)
  [
    'longa', 'doublewhole', 'whole', 'half', 
    'quarter', 'eighth', 'sixteenth', 'thirty-second', 
    'sixty-fourth', 'hundred-twenty-eighth'
  ].each do |value|
    define_method(value.to_sym) { self.value = value; self }
  end

  # Accidental
  ['flat', 'normal', 'sharp' ].each do |value|
    define_method(value.to_sym) { self.accidental = value; self }
  end
  
  def dots(dots = nil)
    if dots
      @dots = dots
      self
    else
      @dots
    end
  end
  
  #####################################################################
  # Class Methods
  #####################################################################
  def self.included(base)
      base.extend(ClassMethods)
  end
  
  module ClassMethods
    # Value (duration)
    [
      'longa', 'doublewhole', 'whole', 'half', 
      'quarter', 'eighth', 'sixteenth', 'thirty-second', 
      'sixty-fourth', 'hundred-twenty-eighth'
    ].each do |value|
      define_method(value.to_sym) do
        obj = self.new
        obj.send(value)
        obj
      end
    end
    
    # Accidental
    ['flat', 'normal', 'sharp' ].each do |value|
      define_method(value.to_sym) do
        obj = self.new
        obj.send(value)
        obj
      end
    end
    
    define_method(:dots) do |dots|
      obj = self.new
      obj.dots(dots)
      obj
    end
    
    
  end

  # (-5).upto(5) do |octave|
  #   self.define_method(octave.to_sym) do
  #     self.octave = octave
  #   end
  # end

end