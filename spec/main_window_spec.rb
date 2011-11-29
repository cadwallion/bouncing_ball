require 'spec_helper'

# there is a segfault bug that is caused when you try to re-use a Gosu::MainWindow
describe MainWindow do
  def ball
    @ball = double()
    @ball.stub(:draw) { }
    @ball.stub(:x) { 5 }
    @ball.stub(:y) { 5 }
    @ball.stub(:width) { 50 }
    @ball.stub(:height) { 50 }
    @ball
  end
  describe "#initialize" do
    it "create a new ball" do
      Ball.should_receive(:new) { ball }
      @x = MainWindow.new
      @x.close
    end
  end
end
