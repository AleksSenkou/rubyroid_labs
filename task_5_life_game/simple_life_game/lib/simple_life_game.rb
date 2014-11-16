require "colorize"
require_relative "cell"

class LifeGame
  def initialize(width = 60, height = 40) 
    @width = width
    @height = height
    @card = Array.new(height) { Array.new(width) { Cell.new } }
  end

  def next_gen!
    @card.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        cell.neighbors = alive_neighbors(y, x)
      end
    end
    @card.each { |line| line.each { |cell| cell.next! } }
  end

  def print_card
    @card.each_with_index { |line, num| line.map { |cell| print cell.alive ? "■".light_blue : ' ' }; puts "\n" }
  end

  private
  def alive_neighbors(y, x) 
    up = (y == 0) ? @height - 1 : y - 1 
    down = (y == @height - 1) ? 0 : y + 1 
    left = (x == 0) ? @width - 1 : x - 1 
    right = (x == @width - 1) ? 0 : x + 1 

    [[y, left], [y, right],                 # sides
     [up, right], [up, x], [up, left],      # over
     [down, left], [down, x], [down, right] # under
    ].inject(0) do |sum, pos|
      sum += @card[pos[0]][pos[1]].to_i
    end
  end
end