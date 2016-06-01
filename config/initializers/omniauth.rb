Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['FACEBOOK_KEY'], FACEBOOK_CONFIG['FACEBOOK_SECRET']
end