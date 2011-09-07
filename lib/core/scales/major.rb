module Harry
  module Scales
    class Major < Harry::Scale
      def set_intervals
        self.intervals = [2,2,1,2,2,2]
      end
    end
  end
  
  def MajorScale(tonic = C())
    Scales::Major.new({:tonic => tonic})
  end
end