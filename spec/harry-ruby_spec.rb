require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Harry do
  it("defines a module called Harry") { Harry.class.should be(Module) }
end

