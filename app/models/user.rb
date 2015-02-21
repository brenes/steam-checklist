class User < ActiveRecord::Base

  has_many :owned_games

end
