Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end