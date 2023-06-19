require "test_helper"

class ChefsShowTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname: "mashrur", email: "sjadcjd@gmail.com", password: "password", password_confirmation: "password")
    @recipe=Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
  end
  test "should get chefs show" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body
  end
end
