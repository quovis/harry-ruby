class Scale
  attr_accessor :intervals, :tonic, :notes
  @notes = []
  
  def parse_intervals
    raise "Invalid intervals" if intervals.class != Array
    self.notes = [ tonic ]
    intervals.each do |interval|
      self.notes.push(self.notes.last + interval)
    end
  end
end