
  class LoginsController < ApplicationController

    def new
    end

    def create
      bar = Bar.find_by(email: params[:email])

      if bar && bar.authenticate(params[:password])
        session[:bar_id] = bar.id
        flash[:success] = 'You are now logged in'
        redirect_to recipes_path
      else
        flash.now[:danger] = "your email or password does not match"
        render 'new'
      end
    end

    def destroy
      session[:bar_id] = nil
      flash[:success] = 'You have logged out'
      redirect_to root_path
    end

  end
