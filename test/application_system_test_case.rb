require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def login_as(user, password)
    visit new_user_session_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: password
    click_on 'Log in'
  end

end
