require 'capybara/dsl'

class BBC_Login
  include Capybara::DSL

  USERNAME_ID = "username"
  PASSWORD_ID = "password"
  SUBMIT_BUTTON_ID = "#submit-button"
  PASSWORD_ERROR_MSG = "#form-message-password"
  USERNAME_ERROR_MSG = "#form-message-username"
  REGISTER_BUTTON_TEXT = "Register now"

  def set_username_value username_attempt
    fill_in USERNAME_ID, with: username_attempt
  end

  def set_password_value password_attempt
    fill_in PASSWORD_ID, with: password_attempt
  end

  def submit_link
    find(SUBMIT_BUTTON_ID)
  end

  def click_submit_link
    submit_link.click
  end

  def get_password_error_msg
    find(PASSWORD_ERROR_MSG).text
  end

  def get_username_error_msg
    find(USERNAME_ERROR_MSG).text
  end

  def click_sign_up_link
    click_link(REGISTER_BUTTON_TEXT)
  end

end
