require "test_helper"

class RecipeTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.create!(chefname: "usame", email: "asjksdkj@example.com")
        @recipe = @chef.recipes.build(name: "chicken parm", description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
    end
    test "recipe without chef should be invalid" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    test "name shouldn't be less than 3 characters" do
        @recipe.name = "a" * 2
        assert_not @recipe.valid?
    end
    test "name shouldn't be more than 100 characters" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid?
    end
    test "description should be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
    test "description shouldn't be less than 5 characters" do
        @recipe.description = "a" * 3
        assert_not @recipe.valid?
    end
    test "description shouldn't be more than 500 characters" do
        @recipe.description = "a" * 501
        assert_not @recipe.valid?
    end
end