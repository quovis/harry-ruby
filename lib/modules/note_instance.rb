module Harry::NoteInstance
  #####################################################################
  # Attributes
  #####################################################################
  attr_accessor :pitch, :octave, :accidental, :value
  
  @@chromatic = [ ["C"], ["C#", "Db"],["D"], ["D#", "Eb"],["E"], ["F"],["F#", "Gb"],["G"], ["G#", "Ab"],["A"], ["A#", "Bb"],["B"]]
  
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
  
  def name
    result = pitch
    result += "#" if accidental == 'sharp'
    result += "b" if accidental == 'flat'
    result
  end
  
  def name_with_octave
    name + octave.to_s
  end

  # Return the position on the chromatic scale
  def position
    @@chromatic.each_index do |index|
      return index if @@chromatic[index].include?(name)
    end
    return nil
  end
  
  # returns a new note transposed up by half_steps
  def +(half_steps)
    result_position = (self.position + half_steps)
    result_class = @@chromatic[result_position % 12][0]

    @result = self.class.new()

    # Divide by 12 steps to get the octaves up or down
    (@result.octave = self.octave + (result_position / 12)) if !self.octave.nil?

    # Return the pitch only (Remove accidentals from text)
    @result.pitch = (result_class.length > 1) ? result_class.chop : result_class

    # Set accidentals
    @result.sharp if result_class.gsub(/[A-G]/, '') == '#'
    @result.flat if result_class.gsub(/[A-G]/, '') == 'b'

    @result
  end

  # returns a new note transposed down by half_steps
  def -(half_steps)
    return self + (-half_steps)
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

end