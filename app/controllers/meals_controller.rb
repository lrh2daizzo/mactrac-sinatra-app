class MealsController < ApplicationController
    get '/meals' do
        if logged_in?
            erb :'/meals/index'
        else
            redirect to '/login'
        end
    end

    get '/meals/new' do
        if logged_in?
            erb :'meals/new'
        else
            redirect to '/login'
        end
    end

    post '/meals' do
        
    end
end