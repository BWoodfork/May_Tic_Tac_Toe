require 'player_factory'
require 'player'

describe PlayerFactory do
  before(:each) do
    @factory = PlayerFactory.new
  end

  it "should create two player objects" do
    @factory.setup_players[0].should be_instance_of Player
    @factory.setup_players[1].should be_instance_of Player
  end
end