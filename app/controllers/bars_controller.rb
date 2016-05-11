
  class BarsController < ApplicationController
    before_action :set_bar, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]

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
    end

    def update
      if @bar.update(bar_params)
        flash[:success] = 'Ypur profile has been updated successfully'
        redirect_to bar_path(@bar)
      else
          render 'edit'
        end
    end

    def show
      @recipes = @bar.recipes.paginate(page: params[:page], per_page: 2)
    end
    private

    def bar_params
      params.require(:bar).permit(:barname, :email, :password)
    end

    def set_bar
      @bar = Bar.find(params[:id])
    end

    def require_same_user
      if current_user != @bar
        flash[:danger] = 'You can only edit your own profile'
        redirect_to root_path
      end
    end
  end
