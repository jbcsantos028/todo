require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:first_category)
    @user = users(:sef)
    login_as(@user, '123456')
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "Categories"
    click_on "Add new category"

    fill_in "Title", with: "Test Title"
    click_on "Create Category"

    assert_text "Category was created successfully."
    assert_text "Test Title"
  end

  test "updating a Category" do
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Title", with: "Updated title"
    click_on "Update Category"

    assert_text "Category title was updated successfully."
    assert_text "Updated title"
  end

  test "viewing a Category" do
    visit categories_url
    click_on "View", match: :first

    assert_text "Category: #{@category.title}"
  end

  test "deleting a Category" do
    visit categories_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_no_text "#{@category.title}"
  end

end
