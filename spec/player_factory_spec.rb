require 'player_factory'
require 'player'
require 'easy_ai'

describe PlayerFactory do
  before(:each) do
    ui = UI.new
    @factory = PlayerFactory.new(@ui)
  end

  it "should create two player objects" do
    @ui.receive_player_number == 1
    @factory.setup_players[0].should be_instance_of Player
    @factory.setup_players[1].should be_instance_of EasyAI
  end

  it "should create two player objects for human vs human" do
    @ui.receive_player_number == 2
    @factory.setup_players[0].should be_instance_of Player
    @factory.setup_players[1].should be_instance_of Player
  end
end