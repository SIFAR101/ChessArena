class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_games
  has_many :games, through: :user_games

  def search_games(user)
    games
      .where(id: user.games)
      .where(state: :in_progress)
  end
end
