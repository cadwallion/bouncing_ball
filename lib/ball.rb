require 'zorder'

class Ball
  attr_accessor :x, :y, :velocity_x, :velocity_y
  attr_reader :image

  def initialize(window)
    @x = rand(window.width)
    @y = rand(window.height)
    @velocity_x = 2.0
    @velocity_y = 2.0

    @image = Gosu::Image.new(window, "media/ball.png", false) 
  end

  def draw
    @image.draw(@x, @y, ZOrder::Ball)
  end

  def location
    [@x, @y]
  end

  def width
    @image.width
  end

  def height
    @image.height
  end

  def move
    @x += @velocity_x
    @y += @velocity_y
  end
end
