class Triangle
  attr_reader :points
  def initialize(args)
    @points = args.map(&:to_i)
  end

  def to_s
    'triangle: ' + points.join(',')
  end
end

class Polygon
  attr_reader :points
  def initialize(args)
    @points = args.map(&:to_i)
  end

  def to_s
    'polygon: ' + points.join(',')
  end
end

class Picture
    attr_reader :shapes, :shape_class
  
    def initialize(shape_class, points)
      @shapes = []
      @shape_class = shape_class
      @shapes << create_shape(points)
    end
  
    def create_shape(points)
      @shape_class.new(points)
    end
  end

a_beautiful_monet = Picture.new(Triangle, [1,5,6])

puts a_beautiful_monet.shapes

a_beautiful_dali = Picture.new(Polygon, [3,6,1,8])

puts a_beautiful_dali.shapes