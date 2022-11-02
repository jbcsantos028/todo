require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @category = categories(:first_category)
    @user = users(:sef)
  end

  test "should not save task without name" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: nil , detail: "sample detail", due_date: Date.new(2022, 11, 05))
    assert_not task.save, "Saved the task without a name"
  end

  test "should not save task with name having less than 4 characters" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: "sed" , detail: "sample detail", due_date: Date.new(2022, 11, 05))
    assert_not task.save, "saved task with name having less than 4 characters"
  end

  test "should not save task with name having more than 30 characters" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: "this title has more than 30 characters so it should not save" , detail: "sample detail", due_date: Date.new(2022, 11, 05))
    assert_not task.save, "saved task with name having more than 30 characters"
  end

  test "should not save task without detail" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: "Sample Name" , detail: nil, due_date: Date.new(2022, 11, 05))
    assert_not task.save, "Saved the task without a detail"
  end

  test "should not save task with detail having less than 10 characters" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: "Sample Name" , detail: "< 10", due_date: Date.new(2022, 11, 05))
    assert_not task.save, "saved task with detail having less than 10 characters"
  end

  test "should not save task without due date" do
    task = Task.new(user_id: @user.id, category_id: @category.id, name: "sample name" , detail: "sample detail", due_date: nil)
    assert_not task.save, "Saved the task without a due date"
  end
end
