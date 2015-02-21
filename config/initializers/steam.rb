STEAM_WEB_API_KEY ||= ENV['STEAM_WEB_API_KEY']

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, STEAM_WEB_API_KEY
end
