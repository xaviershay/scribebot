require 'sinatra'
require 'json'
require 'db'

class Message < ActiveRecord::Base
end

post '/' do
  input = params.fetch('text')
  username = params.fetch('user_name')
  text = if username != 'scribebot'
    regex = /\Ascribe:?\s+/
    if input =~ regex
      message = input.gsub(regex, '')

      Message.create!(
        message: message,
        username: username,
      )
      text = "+:heavy_check_mark:"
    end
  end

  {
    text: text,
  }.to_json
end

get '/' do
  "hello"
end
