require 'dragonfly'
require 'dragonfly-activerecord/store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "d628ded1e2a114ece8e0859a083f497b1ad215aeb064d057f0a853c66ba5f142"

  url_format "/media/:job/:name"

  # datastore :file,
  #   root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    # server_root: Rails.root.join('public')
  datastore Dragonfly::ActiveRecord::Store.new
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
