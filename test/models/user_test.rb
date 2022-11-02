require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(email: nil, password_digest: BCrypt::Password.create('123456'))
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user if email is not unique" do
    first_user = User.create(email: "sef@gmail.com", password_digest: BCrypt::Password.create('123456'))
    second_user = User.new(email: "sef@gmail.com", password_digest: BCrypt::Password.create('password'))
    assert_not second_user.save, "saved user even if email is not unique"
  end

  test "should not save user if email is not unique (not case sensitive)" do
    first_user = User.create(email: "sef@gmail.com", password_digest: BCrypt::Password.create('123456'))
    second_user = User.new(email: "SEF@gmail.com", password_digest: BCrypt::Password.create('password'))
    assert_not second_user.save, "saved user if email is not unique (not case sensitive)"
  end

  test "should not save user with email having more than 50 characters" do
    user = User.new(email: "thisemailhasmorethan50characterssoitshouldnotsave@gmail.com", password_digest: BCrypt::Password.create('123456'))
    assert_not user.save, "saved user with email having more than 50 characters"
  end

  test "should not save user if email is not valid" do
    user = User.new(email: "joseph@gmail", password_digest: BCrypt::Password.create('123456'))
    assert_not user.save, "save user even if email is not valid"
  end
end