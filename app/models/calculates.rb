#encoding: utf-8
require_relative 'directions'
module Calculates

  def self.change_direction(command, direction)
    degrees = Directions.for_degrees(direction)
    if command == 'R'
      degrees += 90
    elsif command == 'L'
      if degrees == 0
        degrees = 270
      else
        degrees -= 90
      end
    end
    degrees = 0 if degrees >= 360
    return Directions.for_cardinal(degrees)
  end

  def self.move_forward(x, y, plan, direction)
    x_position = x
    y_position = y
    x_position = x + 1 if direction == "E"
    y_position = y - 1 if direction == "S"
    x_position = x - 1 if direction == "W"
    y_position = y + 1 if direction == "N"

    if !plan.validates_coord(x_position, y_position)
      self.msg_error = "#{self.msg_error} O robô não pode se locomover para fora da região!"
      return x, y
    else
      return x_position, y_position
    end
  end
end