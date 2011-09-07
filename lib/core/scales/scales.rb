module Harry
  module Scales
    class Major < Harry::Scale
      def set_intervals
        self.intervals = [2,2,1,2,2,2]
      end
    end

    class NaturalMinor < Harry::Scale
      def set_intervals
        self.intervals = [2,1,2,2,1,2]
      end
    end
    
    class HarmonicMinor < Harry::Scale
      def set_intervals
        self.intervals = [2,1,2,2,1,3]
      end
    end

    class HungarianMinor < Harry::Scale
      def set_intervals
        self.intervals = [2,1,3,1,1,3]
      end
    end

    class GypsyMinor < Harry::Scale
      def set_intervals
        self.intervals = [2,1,3,1,1,2]
      end
    end
    
  end

  def MajorScale(tonic = C())
    Scales::Major.new({:tonic => tonic})
  end

  def NaturalMinorScale(tonic = C())
    Scales::NaturalMinor.new({:tonic => tonic})
  end

  def HarmonicMinorScale(tonic = C())
    Scales::HarmonicMinor.new({:tonic => tonic})
  end

  def HungarianMinorScale(tonic = C())
    Scales::HungarianMinor.new({:tonic => tonic})
  end

  def GypsyMinorScale(tonic = C())
    Scales::GypsyMinor.new({:tonic => tonic})
  end
end