
  class BarsController < ApplicationController

    def new
      @bar = Bar.new
    end

    def create
      @bar = Bar.new(bar_params)
      if @bar.save
        flash[:success] = 'Your account has been created'
        redirect_to recipes_path
      else
        render 'new'
      end
    end

    def edit
    end

    def update
    end
    private

    def bar_params
      params.require(:bar).permit(:barname, :email, :password)
    end

  end
