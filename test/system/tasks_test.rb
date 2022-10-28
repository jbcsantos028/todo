require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @category = categories(:first_category)
    @user = users(:sef)
    @date = Date.new(2022, 10, 28)
    @task = tasks(:first_task)
    login_as(@user, '123456')
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Listing all tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "Tasks"
    click_on "Add new task"

    fill_in "Name", with: "Test Task Name"
    fill_in "Detail", with: "Test Task Detail"
    fill_in "Due date", with: "#{@date.to_formatted_s(:db)}"
    select "#{@category.title}", :from => "task[category_id]"
    click_on "Create Task"

    assert_text "Task was created successfully."
    assert_text "Test Task Name"
    assert_text "Test Task Detail"
  end

  test "viewing a Task" do
    visit tasks_url
    click_on "View", match: :first

    assert_text "#{@task.name}"
    assert_text "#{@task.detail}"
    assert_text "#{@task.due_date}"
  end

  test "deleting a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_no_text "#{@task.name}"
    assert_no_text "#{@task.detail}"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Name", with: "Test Task Name"
    fill_in "Detail", with: "Test Task Detail"
    fill_in "Due date", with: "#{@date.to_formatted_s(:db)}"
    select "#{@category.title}", :from => "task[category_id]"
    check 'task_completed'

    click_on "Update Task"

    assert_text "Task was updated successfully."
    assert_text "Status: Completed"
  end

  test "visiting the tasks today" do
    visit tasks_today_url
    assert_selector "h1", text: "Tasks due today"
    assert_text "(You have #{@user.tasks.where('due_date = ?', Date.current).count} task/s to complete today)"
  end

end
