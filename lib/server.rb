require 'sinatra'
require 'json'
require 'db'

class Message < ActiveRecord::Base
  def self.recent(n)
    all
      .order(created_at: :desc)
      .limit(n)
  end

  def self.since(from)
    where('created_at >= ?', from)
  end
end

post '/' do
  input    = params.fetch('text')
  username = params.fetch('user_name')
  token    = params.fetch('token')

  text = if token == ENV['SLACK_TOKEN'].to_s && username != 'scribebot'
    regex = /\Ascribe:?\s+/
    if input =~ regex
      message = input.gsub(regex, '')

      if message =~ /\s/
        Message.create!(
          message: message,
          username: username,
        )
        ":heavy_check_mark:"
      else
        case message
        when "recent"
          Message.recent(3).map do |message|
            "%s %s: %s" % [message.created_at, message.username, message.message]
          end.join("\n")
        when "stats"
          count = Message.since(1.week.ago).count
          "#{count} messages recorded in last week"
        else
          "known commands: recent, stats"
        end
      end
    end
  end

  {
    text: text,
  }.to_json
end

get '/' do
  "hello"
end
