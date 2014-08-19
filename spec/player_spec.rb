require 'player'

describe Player do
  before (:each) do
    @player = Player.new("x")
  end

  xit "should give player a name" do
    @player.name = "byron"
    @player.name.should == "byron"
  end

  xit "should set players token to x" do
    @player.token = "X"
    @player.token.should == "X"
  end

  xit "should set players token to o" do
    @player.token = "o"
    @player.token.should == "o"
  end
end