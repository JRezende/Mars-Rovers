#encoding: utf-8
module Directions

  def self.for_degrees(direction)
    case direction
      when 'N' then
        0
      when 'S' then
        180
      when 'E' then
        90
      when 'W' then
        270
    end
  end

  def self.for_cardinal(degree=0)
    case degree
      when 0 then
        'N'
      when 180 then
        'S'
      when 90 then
        'E'
      when 270 then
        'W'
    end
  end
end