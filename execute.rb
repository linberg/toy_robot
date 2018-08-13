require_relative 'lib/computer'

computer = Computer.new

puts 'Please input command in Robotspeak ("exit" to quit): '

command = STDIN.gets.chomp

while command
  output = computer.execute(command)
  puts output if command == 'REPORT'
  command = STDIN.gets.chomp
  break if command == 'exit'
end
