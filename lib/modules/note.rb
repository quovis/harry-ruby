module Note
  #####################################################################
  # Attributes
  #####################################################################
  attr_accessor :pitch, :octave, :accidental, :dotted, :value

  #####################################################################
  # Instance Methods
  #####################################################################
  [
    'longa', 'doublewhole', 'whole', 'half', 
    'quarter', 'eighth', 'sixteenth', 'thirty-second', 
    'sixty-fourth', 'hundred-twenty-eighth'
  ].each do |value|
    define_method(value.to_sym) { self.value = value; self }
  end

  #####################################################################
  # Class Methods
  #####################################################################
  def self.included(base)
      base.extend(ClassMethods)
  end
  
  module ClassMethods
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
  end

  # (-5).upto(5) do |octave|
  #   self.define_method(octave.to_sym) do
  #     self.octave = octave
  #   end
  # end

end