require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @user = users(:sef)
  end

  test "should not save category without title" do
    category = Category.new(user_id: @user.id, title: nil)
    assert_not category.save, "Saved the category without a title"
  end

  test "should not save category within the same user if title is not unique" do
    first_category = Category.create(user_id: @user.id, title: "Sample Title")
    second_category = Category.new(user_id: @user.id, title: "Sample Title")
    assert_not second_category.save, "Saved the category within the same user even if title is not unique"
  end

  test "should not save category within the same user if title is not unique (not case sensitive)" do
    first_category = Category.create(user_id: @user.id, title: "Sample Title")
    second_category = Category.new(user_id: @user.id, title: "sample title")
    assert_not second_category.save, "Saved the category within the same user if title is not unique (not case sensitive)"
  end

  test "should not save category with title having less than 3 characters" do
    category = Category.new(user_id: @user.id, title: "hi")
    assert_not category.save, "Saved the category with title having less than 3 characters"
  end

  test "should not save category with title having more than 25 characters" do
    category = Category.new(user_id: @user.id, title: "this title has more than 25 characters")
    assert_not category.save, "Saved the category with title having more than 25 characters"
  end
end
