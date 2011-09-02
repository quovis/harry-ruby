# Sequencer is a class given to group notes.

class Harry::Sequencer
  #####################################################################
  # Instance Methods
  #####################################################################

  # bpm and time signature
  def initialize(options = { :bpm => 120, :time_signature => "4x4" })
    @bpm = options[:bpm]
    @time_signature = options[:time_signature]
  end

  # Sets and returns bpms.
  #
  # If no bpm are passed it just returns current bpms
  #
  # If bpms are passed returns the sequencer with bpms modified
  #
  def bpm(bpm = nil)
    if bpm
      @bpm = bpm 
      self
    else
      @bpm
    end
  end

  # Sets and returns time signature
  # If no time signature is passed it just returns current time signature
  # If time signature is passed returns the sequencer with time signature modified
  def time_signature(ts = nil)
    if ts
      @time_signature = ts
      self
    else
      @time_signature
    end
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