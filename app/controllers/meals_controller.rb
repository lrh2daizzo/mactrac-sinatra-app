class MealsController < ApplicationController

    use Rack::Flash

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
            if params[:meal].any? {|k,v| v == ""}
                flash[:message] = "1 or more attributes left blank."
                redirect to '/meals/new'
            else
                @meal = current_user.meals.build(params[:meal])
                if @meal.save
                    flash[:message] = "Succesfully created meal."
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

    get '/meals/:id/edit' do
        if logged_in?
            @meal = Meal.find_by_id(params[:id])
            if @meal && @meal.user == current_user
                erb :'/meals/edit'
            else
                redirect to '/meals'
            end
        else
            redirect to '/login'
        end
    end

    patch '/meals/:id' do
        if logged_in?
            if params[:meal].any? {|k,v| v == ""}
                redirect to "/meals/#{params[:id]}/edit"
            else
                @meal = Meal.find_by_id(params[:id])
                if @meal && @meal.user == current_user
                    if @meal.update(params[:meal])
                        flash[:message] = "Successfully updated meal."
                        redirect to "/meals/#{@meal.id}"
                    else
                        redirect to "/meals/#{@meal.id}/edit"
                    end
                else
                    redirect to '/meals'
                end
            end
        else
            redirect to '/login'
        end
    end

    delete '/meals/:id/delete' do
        if logged_in?
            @meal = Meal.find(params[:id])
            if @meal && @meal.user == current_user
                @meal.delete
            end
            redirect to '/meals'
        else
            redirect to '/login'
        end
    end
end