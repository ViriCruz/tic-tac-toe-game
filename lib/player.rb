# frozen_string_literal: true
# This class will only handle the name and the option chose by the player
class Player
  attr_reader :name, :option
  def initialize(name, option)
    @name = name
    @option = option
  end
end
