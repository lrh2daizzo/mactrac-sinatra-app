class MealsController < ApplicationController
    get '/meals' do
        if logged_in?
            @user = User.find(session[:user_id])
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
        if logged_in?
            if params[:meal] == ""
                redirect to '/meals/new'
            else
                @meal = current_user.meals.build(params[:meal])
                if @meal.save
                    redirect to "/meals/#{@meal.id}"
                else
                    redirect to "/meals/new"
                end
            end
        else
            redirect to "/login"
        end
    end

    get '/meals/:id' do
        if logged_in?
            @meal = Meal.find_by_id(params[:id])
            erb :'meals/show'
        else
            redirect to '/login'
        end
    end

    
end