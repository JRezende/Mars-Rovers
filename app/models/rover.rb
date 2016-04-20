#encoding: utf-8
require_relative 'calculates'
class Rover
  # To change this template use File | Settings | File Templates.
  attr_accessor :direction, :initial_pos, :commands, :msg_error

  def initialize(initial_pos, commands)
    validate_data(initial_pos, commands)
    if self.msg_error.blank?
      self.initial_pos = initial_pos
      self.commands = commands
    end
  end

  def validate_data(initial_pos, commands)
    if initial_pos.blank? or commands.blank?
      self.msg_error = "* A posição e os comandos não podem ser nulos!"
    else
      if initial_pos.split(' ').size != 3
        self.msg_error = "* Posição atual do robô não é válida!"
      end
    end
  end

  def move(plan)
    results = ''
    x_position, y_position, self.direction = define_position(initial_pos)
    self.commands.split('').each do |command|
      if command == "M"
        x_position, y_position = Calculates.move_forward(x_position, y_position, plan, self.direction)
      elsif command == "L" or command == "R"
        self.direction = Calculates.change_direction(command, self.direction)
      end
    end
    results = "#{x_position} #{y_position} #{self.direction}"
  end

  def define_position(initial_pos)
    coordinates = initial_pos.split(" ")
    x_initial = coordinates[0].to_i
    y_initial = coordinates[1].to_i
    cardinal_point = coordinates[2]
    return x_initial, y_initial, cardinal_point
  end
end