class UsersController < ApplicationController
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

    get '/signup' do
     erb :'users/new'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(params[:user])
            session[:user_id] = @user.id
            redirect `/meals`
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect `/meals`
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to `/meals`
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy 
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end
