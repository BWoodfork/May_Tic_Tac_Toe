class SetPlayer
  def initialize(factory)
    @factory = factory
  end

  def current_player
    @factory.find_players[@factory.player_that_is_up]
  end
end