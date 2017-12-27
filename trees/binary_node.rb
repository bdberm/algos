class BinaryNode

  attr_accessor :left, :right, :parent
  attr_reader :val

  def initialize(val, left=nil, right=nil, parent=nil)
    @val = val
    @left = left
    @right = right
    @parent = parent
  end

end
