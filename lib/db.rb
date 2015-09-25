require "sinatra"
require "sinatra/activerecord"

set :database, (ENV['DATABASE_URL'] || 'postgres://localhost/scribebot_development')
