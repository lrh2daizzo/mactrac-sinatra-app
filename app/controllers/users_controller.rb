class UsersController < ApplicationController
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

    get '/signup' do
     erb :'users/new'
    end

    post '/signup' do
        params.inspect
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(params[:user])
            session[:user_id] = @user.id
        end
    end

    get '/login' do
        
    end
end
