require 'table'
require 'robot'
require 'pry'

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
      report
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
end
