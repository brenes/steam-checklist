class User < ActiveRecord::Base

  has_many :owned_games

  def reload_owned_games

    steam_url = URI "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{STEAM_WEB_API_KEY}&steamid=#{self.steamid}&format=json&include_appinfo=1"

    games = JSON.parse Net::HTTP.get steam_url

    games["response"]["games"].each do |g|
      owned_game = owned_games.includes(:game).find_by(games: { appid: g["appid"] })
      if owned_game.nil?
        game = Game.find_by(appid: g["appid"])
        game ||= Game.create appid: g["appid"],
          name: g["name"],
          icon_url: g["img_icon_url"]

        owned_game = owned_games.create game: game
      end
      owned_game.update_attributes play_time: g["playtime_forever"]

    end

  end

end
