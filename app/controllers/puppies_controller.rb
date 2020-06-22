require 'pry'

class PuppiesController < ApplicationController
    set :views, "app/views/puppies"
    
    get '/puppies/new' do
        erb :new
    end

    get '/puppies/:id' do
        @puppy = Puppy.find(params[:id])
        
        erb :show
    end

    get '/puppies/:id/edit' do
        @puppy = Puppy.find(params[:id])

        erb :edit
    end

    post '/puppies' do
        puppy = Puppy.create(params)

        redirect "/puppies/#{puppy.id}"
    end

    patch '/puppies/:id' do
        puppy = Puppy.find(params[:id])

        puppy.update(name: params[:name], breed: params[:breed])

        redirect "/puppies/#{puppy.id}"
    end

    delete '/puppies/:id' do
        puppy = Puppy.find(params[:id])

        puppy.destroy

        redirect "/"
    end
end