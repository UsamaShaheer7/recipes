require "test_helper"

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef=Chef.create!(chefname: "mashrur", email: "", password: "password", password_confirmation: "password")
  end
  test "reject an invalid edit" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params:{chef:{chefname: " ", email: " ", password: "password", password_confirmation: "password"}}
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    end
  test "accept valid signup" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params:{chef:{chefname: "usama", email: "", password: "password", password_confirmation: "password"}}
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "usama", @chef.chefname
    assert_match "", @chef.email
  end

end
