class RecipesController<ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show]
    def index
        @recipes = Recipe.all
    end
    def show
        # @recipe = Recipe.find(params[:id])
    end
    def new
        @recipe = Recipe.new
    end
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.find(1)
        if @recipe.save
            flash[:success] = "Your recipe was created successfully!"
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end
    def edit
        # @recipe = Recipe.find(params[:id])
    end
    def update
        # @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end
    def destroy
        @recipe = Recipe.find(params[:id])
        flash[:sucess] = "Recipe deleted successfully!"
        @recipe.destroy
        redirect_to recipes_path
    end
    private
    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end