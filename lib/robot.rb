class Robot
  attr_accessor :orientation

  ORIENTATIONS = [
    NORTH = :north,
    EAST = :east,
    SOUTH = :south,
    WEST = :west
  ]

  def left
  end

  def right
  end

  def orient(orientation)
    if Robot::ORIENTATIONS.include?(orientation)
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
