class Triangle
  # write code here
  attr_reader :x, :y, :z

  def initialize(x, y, z)
  @x = x
  @y = y
  @z = z
    validate_triangle
  end

  def kind
    if x == y && y == z
      :equilateral
    elsif x == y || y == z || x == z
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    true_triangle = [(x + y > z), (x + z > y), (y + z > x)]
    [x, y, z].each do |side|
      true_triangle << false if side <= 0
    end
    raise TriangleError if true_triangle.include?(false)
  end

  class TriangleError < StandardError
  end
end