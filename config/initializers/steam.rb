
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_WEB_API_KEY'] || Rails.application.secrets.steam_api_key
end
