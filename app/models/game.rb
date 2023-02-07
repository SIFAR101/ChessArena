class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  enum state: { in_progress: 0, checkmate: 1, stalemate: 2 }
  enum turns: { white: 0, black: 1 }

  before_create :set_fen
  before_create :set_pgn

  def set_fen
    prefix = if turn == 'white'
               'w'
             else
               'b'
             end
    self.fen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR #{prefix} KQkq - 0 1"
  end
end
