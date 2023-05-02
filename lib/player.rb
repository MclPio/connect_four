# frozen_string_literal: true

class Player
  attr_accessor :color

  def initialize(color)
    @color = color_choice(color)
  end

  def color_choice(color)
    case color
    when 'red'
      '🔴'
    when 'yellow'
      '🟡'
    end
  end
end
