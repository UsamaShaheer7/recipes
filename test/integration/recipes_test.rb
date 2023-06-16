require "test_helper"

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname: "mashrur", email: "sjadcjd@gmail.com")
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
end
