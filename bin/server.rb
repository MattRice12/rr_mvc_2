require 'webrick'
require 'socket'
require 'timeout'
require 'uri'
require 'erb'
require 'json'
require 'pry'
require 'faker'
require_relative '../config/path'
require_relative '../config/router'
require_relative '../config/app_router'
require_relative '../app/controllers/application_controller'
require_relative '../lib/all'

module App
  # Place all data here inside of a method
  def App.tweets
    # This is an example
    @all_tweets ||= [
      { message: Faker::Hipster.paragraph(2, true), id: 1},
      { message: "badd tweet!", id: 2},
      { message: "ohno tweet!", id: 3},
      { message: "eehhh tweet", id: 4},
    ]
  end

  def App.posts
    @posts ||= (1..4).map do
      Post.new(
        Faker::StarWars.character,  Faker::Hipster.word.capitalize, Faker::Hipster.sentence(5), "Published")
    end
  end

  def App.comments
    @comments ||= (1..5).map do
      Comment.new(
        Faker::SlackEmoji.people,
        Faker::StarWars.character)
    end
  end
end

system('clear')

def start_custom_webbrick_server
  server = WEBrick::HTTPServer.new(Port: 3001)
  server.mount "/", WEBBrickServer

  trap(:INT)  { server.shutdown }
  trap(:TERM) { server.shutdown }

  puts "The server is running and awaiting requests at http://localhost:3001/"
  server.start
end

def start_custom_tcp_server
  CustomTCPServer.new.start
end


if ARGV[0] == '--no-webrick'
  start_custom_tcp_server
else
  start_custom_webbrick_server
end
