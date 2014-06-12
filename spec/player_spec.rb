require 'player'

describe Player do
  before (:each) do
    @player = Player.new("x")
  end

  it "should give player a name" do
    @player.name = "byron"
    @player.name.should == "byron"
  end

  it "should set players token to x" do
    @player.token = "X"
    @player.token.should == "X"
  end

  it "should set players token to o" do
    @player.token = "o"
    @player.token.should == "o"
  end
end