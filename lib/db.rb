require "sinatra"
require "sinatra/activerecord"

set :database, {
  adapter:  "postgresql",
  database: ENV.fetch('DATABASE_URL', 'scribebot_development')
}
