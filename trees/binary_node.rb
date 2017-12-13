class binaryNode
  attr_accessor :left, :right
  attr_reader :val

  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end
end
