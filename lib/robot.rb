class Robot
  attr_accessor :orientation

  CARDINALS = [
    NORTH = :north,
    EAST = :east,
    SOUTH = :south,
    WEST = :west
  ]

  def left
    self.orientation = CARDINALS[CARDINALS.index(orientation) - 1]
  end

  def right
    self.orientation = CARDINALS.fetch(CARDINALS.index(orientation) + 1, CARDINALS[0])
  end

  def orient(orientation)
    if CARDINALS.include?(orientation)
      self.orientation = orientation
    end
  end

  def coordinates
    case self.orientation
    when :north
      { x: 0, y: 1 }
    when :east
      { x: 1, y: 0 }
    when :south
      { x: 0, y: -1 }
    when :west
      { x: -1, y: 0 }
    end
  end
end
