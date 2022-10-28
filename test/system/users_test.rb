require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "creating a User" do
    visit signup_url

    fill_in "Email", with: "andy@gmail.com"
    fill_in "Password", with: "pass123"
    click_on "Create account"

    assert_text "Welcome to Listed. You have successfully signed up!"
    assert_text "Welcome, andy@gmail.com!"
  end
end
