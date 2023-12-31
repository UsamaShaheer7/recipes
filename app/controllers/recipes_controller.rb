class RecipesController<ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @recipes = Recipe.all
        # @recipes = Recipe.paginate(page: params[:page], per_page: 5)
    end
    def show
        # @recipe = Recipe.find(params[:id])
    end
    def new
        @recipe = Recipe.new
    end
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = current_chef
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
    def require_same_user
        if current_chef != @recipe.chef and !current_chef.admin?
            flash[:danger] = "You can only edit or delete your own recipes"
            redirect_to recipes_path
        end
    end

end