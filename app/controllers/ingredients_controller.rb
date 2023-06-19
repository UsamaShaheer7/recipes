class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :update, :show]
    before_action :require_admin, except: [:show, :index]
    # before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @ingredients = Ingredient.all
    end
    def new
        @ingredient = Ingredient.new
    end
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            flash[:success] = "Your ingredient was created successfully!"
            redirect_to ingredient_path(@ingredient)
        else
            render 'new'
        end
    end
    def edit
        @ingredient = Ingredient.find(params[:id])
    end
    def update
        if @ingredient.update(ingredient_params)
            flash[:success] = "Your ingredient was updated successfully!"
            redirect_to ingredient_path(@ingredient)
        else
            render 'edit'
        end
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end
    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
    def require_admin 
        if !logged_in? || (logged_in? and !current_chef.admin?)
            flash[:danger] = "Only admin users can perform that action"
            redirect_to ingredients_path
        end
    end
end