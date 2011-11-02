$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'harry-ruby'
include Harry


# Create central C
middle_c = C(4)

# You can create notes with accidentals as well
sharp = C(4).sharp
flat = C(4).flat

# You can normalize a note with an accidental as well
sharp = sharp.normal


