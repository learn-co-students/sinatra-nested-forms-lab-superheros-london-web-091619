require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do

        @team = Team.new(params)
        @super_heros = []
       
        params["team"]["heros"].each {|hero| @super_heros << SuperHero.new(hero)}
        erb :team
    end
end
