require_relative 'piece'
require 'byebug'

class Board
  def initialize
    @piece = Piece.new #temp null piece
    @grid = Array.new(8) {Array.new(8, nil)}
  end

  def move_piece(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    raise "No piece at start" if start_piece.nil?
    raise "Can't move there" if start_piece.valid_move?(start_pos, end_pos)
  end


end
