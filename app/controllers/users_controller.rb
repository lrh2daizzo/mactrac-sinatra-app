class UsersController < ApplicationController
    get '/users/:slug' do
    end

    get '/signup' do
     erb :'users/new'
    end

    post '/signup' do
        if params [:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(params[:user])
            session[:user_id] = @user.id
            redirect to '/meals'
        end
    end

    get '/login' do
        
    end
end
