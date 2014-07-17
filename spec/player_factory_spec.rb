require 'player_factory'
require 'player'
require 'easy_ai'
require 'ui'

describe PlayerFactory do
  before(:each) do
    @ui = double(receive_player_number: 1)
    @factory = PlayerFactory.new(@ui)
  end

  it "should create one human object and one AI object" do
    double(receive_player_number: 1)
    @factory.setup_players[0].should be_instance_of Player
    @factory.setup_players[1].should be_instance_of EasyAI
  end
end