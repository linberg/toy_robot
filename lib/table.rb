class Table
  attr_accessor :position

  def place(x, y)
    self.position = { x: x, y: y } if valid_position?(x, y)
  end

  def valid_position?(x, y)
    (x >= 0 && x <= 5 && y >= 0 && y <= 5)
  end

  def has_a_robot?
    self.position == nil ? false : true
  end
end
