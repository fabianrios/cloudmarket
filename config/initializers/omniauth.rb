OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '643420465709361', '9770996632e5bc501016ead6ab467723'
end

