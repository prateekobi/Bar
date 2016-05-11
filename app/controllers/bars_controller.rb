
  class BarsController < ApplicationController

    def index
      @bars = Bar.paginate(page: params[:page], per_page: 3)
    end

    def new
      @bar = Bar.new
    end

    def create
      @bar = Bar.new(bar_params)
      if @bar.save
        flash[:success] = 'Your account has been created'
        session[:bar_id] = @bar.id
        redirect_to recipes_path
      else
        render 'new'
      end
    end

    def edit
      @bar = Bar.find(params[:id])
    end

    def update
      @bar = Bar.find(params[:id])
      if @bar.update(bar_params)
        flash[:success] = 'Ypur profile has been updated successfully'
        redirect_to recipes_path #CHANGE TO SHOW BAR PAGE
      else
          render 'edit'
        end
    end

    def show
      @bar = Bar.find(params[:id])
      @recipes = @bar.recipes.paginate(page: params[:page], per_page: 2)
    end
    private

    def bar_params
      params.require(:bar).permit(:barname, :email, :password)
    end

  end
