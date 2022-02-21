require 'telegram_bot'
require 'telegram_bot/response_error'
require 'cgi'
require 'yaml'
require 'sqlite3'
require './lib.rb'


leaderboards = Hash.new

################### Manage database #####################
db = SQLite3::Database.new 'database.db'
#   Create table if not present
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS chats (
      chat_id INT PRIMARY KEY,
      lb_number INT
  );
SQL

#   Load values from database
db.execute 'SELECT * FROM chats;' do |row|
  leaderboards[row[0]] = row[1]
end


################### Load the config ####################
config = YAML.load_file('config.yml')

#   Set the variables needed for the bot
token = config['keys'][0]['token']
puts "Set `#{token}` as the token"

session_cookie = config['keys'][0]['cookie']
puts "Set `#{session_cookie}` as the session cookie"


#   If there is a defined hello message, use that. Otherwise, warn the admin and use the default
if config['messages'][0]['start'].nil?
  puts "There was not a start message in the config, using the default"
  hello_msg = "Hi! I have been created with the purpose of passing butter.\n\nJk, just look up my different functions and use me senpai."  
else
  hello_msg = config['messages'][0]['start']
end


################## Start the bot ########################
bot = TelegramBot.new(token: token)


bot.get_updates(fail_silently: true) do |message|
  command = message.get_command_for(bot)
  if !command.nil?
    puts "@#{message.from.username}: #{message.text}"
  end

  begin
    message.reply do |reply|
      case command


        ################### /START ###################
      when /start/i
        reply.text = hello_msg



        ################### /GREET ###################
      when /greet/i
        reply.text = "#{$greetings.sample.capitalize} #{message.from.first_name}!"



        ############## /OTHER ##############
      when /other/i
        #Other stuff


      ####### send the message ######
      if !reply.text.nil?
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end

  rescue TelegramBot::ResponseError => e
    retry
  end
end

