require_relative 'table'
require_relative 'robot'

class Computer
  attr_reader :table
  attr_reader :robot

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def execute(command)
    data = command.split(/\s+/)
    operator = data.first
    coordinates = data.last

    case operator
    when 'PLACE'
      place(coordinates)
    when 'REPORT'
      report if @table.has_a_robot?
    when 'MOVE'
      @table.has_a_robot? ? move : 'Please place the robot.'
    when 'LEFT'
      @table.has_a_robot? ? left : 'Please place the robot.'
    when 'RIGHT'
      @table.has_a_robot? ? right : 'Please place the robot.'
    end
  end

  def place(position)
    data = position.split(/,/)
    x = data[0].to_i
    y = data[1].to_i
    orientation = data[2].downcase.to_sym

    @table.place(x, y)
    @robot.orient(orientation)
  end

  def report
    position = @table.position
    orientation = @robot.orientation
    "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
  end

  def move
    coordinate = @robot.coordinates
    position = @table.position
    @table.place(position[:x] + coordinate[:x], position[:y] + coordinate[:y])
  end

  def left
    @robot.left
  end

  def right
    @robot.right
  end
end
