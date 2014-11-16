class Cell
  attr_accessor :neighbors
  attr_reader :alive

  def initialize
    @alive = (rand(0..1) == 1) ? true : false
  end

  def next!
    @alive = @alive ? (2..3) === @neighbors : 3 == @neighbors
  end

  def to_i
    @alive ? 1 : 0
  end
end