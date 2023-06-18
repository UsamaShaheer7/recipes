require "test_helper"

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname: "mashrur", email: "sjadcjd@gmail.com", password: "password", password_confirmation: "password")
    @recipe=Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
  end
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  test "should get recipes listen" do
    get recipes_path
    assert_template 'recipes/index'
    assert_select "a[href=?]", recipes_path, text: "Recipes"
    assert_select "a[href=?]", recipes_path, text: "New Recipe"
  end
  test "should get recipes show" do
    sign_in_as(@chef, "password")
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body
    assert_select "a[href=?]", edit_recipe_path(@recipe), text: "Edit Recipe"
    assert_select "a[href=?]", recipe_path(@recipe), text: "Delete Recipe"
    assert_select "a[href=?]", recipes_path, text: "Back to Recipes"
  end
  test "create new valid recipe" do
    sign_in_as(@chef, "password")
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe="chicken saute"
    description_of_recipe="add chicken, add vegetables, cook for 20 minutes, serve delicious meal"
    assert_difference 'Recipe.count', 1 do
      post recipes_path, params:{recipe:{name: name_of_recipe, description: description_of_recipe}}
    end
    follow_redirect!
    assert_match name_of_recipe.capitalize, response.body
    assert_match description_of_recipe, response.body
  end
  test "reject invalid recipe submissions" do
    sign_in_as(@chef, "password")
    get new_recipe_path
    assert_template 'recipes/new'
    assert_no_difference 'Recipe.count' do
      post recipes_path, params:{recipe:{name: " ", description: " "}}
    end
    assert_template 'recipes/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end

