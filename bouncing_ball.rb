require 'gosu'

module ZOrder
  Background, Ball, UI = (0..5).to_a
end

class Ball
  attr_accessor :x, :y, :velocity_x, :velocity_y

  def initialize(window)
    @x = rand(window.width)
    @y = rand(window.height)
    @velocity_x = 2.0
    @velocity_y = 2.0

    @image = Gosu::Image.new(window, "ball.png", false) 
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

class MainWindow < Gosu::Window

  TITLE = "Bouncing Ball"

  def initialize
    super(640,480, false)
    self.caption = TITLE

    @ball = Ball.new(self)
    @max_x = width - @ball.width
    @max_y = height - @ball.height
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    update_ball_location
  end

  def draw
    @ball.draw
    @font.draw("X: #{@ball.x} Y: #{@ball.y}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffffff)
  end

  def update_ball_location
    @ball.move

    if @ball.x < 0 || @ball.x > @max_x
      @ball.velocity_x = -@ball.velocity_x

      if @ball.x < 0
        @ball.x = 0
      elsif @ball.x > @max_x
        @ball.x = @max_x
      end
    end

    if @ball.y < 0 || @ball.y > @max_y 
      @ball.velocity_y = -@ball.velocity_y

      if @ball.y < 0
        @ball.y = 0
      elsif @ball.y > @max_y
        @ball.y = @max_y
      end
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = MainWindow.new
window.show
