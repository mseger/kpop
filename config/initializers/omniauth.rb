FACEBOOK_KEYS = YAML.load_file("#{Rails.root}/config/facebook_keys.yml")[Rails.env]
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_KEYS['app_id'], FACEBOOK_KEYS['secret']
end

