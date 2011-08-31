# Sequencer is the root class for handling composition

class Sequencer
  #####################################################################
  # Attributes Methods
  #####################################################################
  attr_accessor :bpm
  attr_accessor :time_signature
  
  #####################################################################
  # Instance Methods
  #####################################################################
  def initialize(options = { :bpm => 120, :time_signature => "4x4" })
    self.bpm = options[:bpm]
    self.time_signature = options[:time_signature]
  end
  
  #####################################################################
  # Class Methods
  #####################################################################
  
  # Used to instantiate a sequencer with a specific value for bpm
  def self.bpm(bpm)
    Sequencer.new( :bpm => bpm )
  end

  # Used to instantiate a sequencer with a specific value for time_signature
  def self.time_signature(ts)
    Sequencer.new( :time_signature => ts )
  end
  
end