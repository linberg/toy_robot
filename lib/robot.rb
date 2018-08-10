class Robot
  attr_accessor :orientation

  ORIENTATIONS = [
    NORTH = :north,
    EAST = :east,
    SOUTH = :south,
    WEST = :west,
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
end
