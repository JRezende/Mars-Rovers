#encoding: utf-8
class Plan
  # To change this template use File | Settings | File Templates.
  attr_accessor :x_max, :y_max, :x_min, :y_min, :msg_error

  def initialize(coord_upper)
    self.x_min = 0
    self.x_max = 5
    self.y_min = 0
    self.y_max = 5
    if coord_upper.blank? or (coord_sep = coord_upper.split(' ')).size != 2 or coord_sep[0].to_i < self.x_min or coord_sep[1].to_i < self.y_min
      msg_error = "Coordenadas superiores inválidas!"
    else
      self.x_max = coord_sep[0].to_i
      self.y_max = coord_sep[1].to_i
    end
  end

  def validates_coord(x, y)
    (x >= self.x_min) and (x <= self.x_max ) and (y >= self.y_min) and (y <= self.y_max )
  end
end