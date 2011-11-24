require 'spec_helper'

describe Ball do
  def window
    unless @window
      @window = double()
      @window.stub(:width) { 640 }
      @window.stub(:height) { 480 }
    end
    @window
  end

  before(:each) do
    image = double()
    image.stub(:draw) { }
    Gosu::Image.stub(:new) { image }
  end

  subject { Ball.new(window) }
    
  describe "#initialize" do
    it "should take a window context parameter" do
      expect { Ball.new }.to raise_error
      expect { Ball.new(window) }.to_not raise_error
    end

    it "should set the default velocities" do
      subject.velocity_x.should_not be_nil 
      subject.velocity_y.should_not be_nil 
    end

    it "should set the x and y to random values between 0 and width/height" do
      subject.x.should be_between(0, window.width)
      subject.y.should be_between(0, window.height)
    end

    it "should create a new image context to the passed window" do
      Gosu::Image.should_receive(:new).with(window, "media/ball.png", false)
      Ball.new(window)
    end
  end

  describe "#draw" do
    it "should call draw on the image context with current coordinates" do
      subject.image.should_receive(:draw).with(subject.x, subject.y, ZOrder::Ball)
      subject.draw
    end
  end

  describe "#move" do
    it "should adjust the x and y by the corresponding velocities" do
      current_x = subject.x
      current_y = subject.y

      subject.move

      subject.x.should == (current_x + subject.velocity_x)
      subject.y.should == (current_y + subject.velocity_y)
    end
  end

  describe "#location" do
    it "should return an array of current [x, y] coordinates" do
      subject.location.should == [subject.x, subject.y]
    end
  end

  describe "#height" do
    it "should delegate to the image context's height method" do
      subject.image.should_receive(:height)
      subject.height
    end
  end

  describe "#width" do
    it "should delegate to the image context's width method" do
      subject.image.should_receive(:width)
      subject.width
    end
  end
end
