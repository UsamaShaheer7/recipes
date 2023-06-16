require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest
  test "should get home" do 
    get pages_home_url #pages controller, home action
    assert :success
  end
  test "should get root" do
    get root_url
    assert :success
  end
end
