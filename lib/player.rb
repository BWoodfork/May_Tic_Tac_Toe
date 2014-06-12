require 'ui'

class Player
  attr_accessor :name, :token

  def initialize(token)
    @token = token
  end
end