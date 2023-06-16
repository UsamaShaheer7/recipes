require "test_helper"

class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chefname: "shaheer", email: "shaheerusame6@gmail.com")
    end
    test "chef should be valid" do
        assert @chef.valid?
    end
    test "chefname should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    test "chefname shouldn't be less than 3 characters" do
        @chef.chefname = "a" * 2
        assert_not @chef.valid?
    end
    test "chefname shouldn't be more than 40 characters" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    test "email should be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end
    test "email shouldn't be less than 5 characters" do
        @chef.email = "a" * 5
        assert_not @chef.valid?
    end
    test "email shouldn't be more than 100 characters" do
        @chef.email = "a" * 100 + "@example.com"
        assert_not @chef.valid?
    end
    test "email should be unique" do
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@example.com]
        valid_addresses.each do |valid|
            @chef.email = valid
            assert @chef.valid?, '#{valid.inspect} should be valid'
        end
    end
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com]
        invalid_addresses.each do |invalid|
            @chef.email = invalid
            assert_not @chef.valid?, '#{invalid.inspect} should be invalid'
        end
    end
    test "email should be lower case before hitting db" do
        mixed_email = "SHAHEER@EXAMPLE.COM"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email  
    end
end