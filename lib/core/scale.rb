class Harry::Scale
  attr_accessor :intervals, :tonic, :notes
  @notes = []

  def initialize(options = {})
    self.tonic = options[:tonic] if options[:tonic]
    self.intervals = options[:intervals] if intervals
    set_intervals
  end


  alias_method :orig_intervals, :intervals=

  def intervals=(intervals)
    self.orig_intervals(intervals)
    parse_intervals
  end
  
  # This function is called after inititalize as a callback for child classes
  # For Harry::Scale it's a no-op
  # ex.
  # class Major < Harry:Scale
  #   def set_intervals
  #     self.intervals = [2,2,1,2,2,2]
  #   end
  # end
  def set_intervals
  end
  
  def parse_intervals
    raise "Invalid intervals" if intervals.class != Array
    raise "Invalid tonic" if !tonic
    self.notes = [ tonic ]
    intervals.each do |interval|
      self.notes.push(self.notes.last + interval)
    end
  end
end