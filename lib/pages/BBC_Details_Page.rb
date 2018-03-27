require 'capybara/dsl'

class BBC_Details_Page
  include Capybara::DSL

  EMAIL_ID = "#email"
  PASSWORD_VALUE_NAME = "password"
  PASSWORD_ERROR_MSG = "#form-message-password"
  POSTCODE_VALUE_NAME = "postcode"
  POSTCODE_ERROR_MSG = "#form-message-postcode"
  GENDER_VALUE = "#gender-input"
  # GENDER_OPTION_VALUES = ["female","male","other","prefer not to say"]
  GENDER_ERROR_MSG = "#form-message-gender"
  SUBMIT_BUTTON_ID = "#submit-button"

  def find_email
    find(EMAIL_ID)['id']
  end

  def submit_form
    find(SUBMIT_BUTTON_ID).click
  end

  def set_password_value new_password
    fill_in PASSWORD_VALUE_NAME, with: new_password
  end

  def get_password_error_msg
    find(PASSWORD_ERROR_MSG).text
  end

  def set_postcode_value new_postcode
    fill_in POSTCODE_VALUE_NAME, with: new_postcode
  end

  def get_postcode_error_msg
    find(POSTCODE_ERROR_MSG).text
  end

  def set_gender_value new_gender_index
    find(GENDER_VALUE).find(:xpath,"option[#{new_gender_index}]").select_option
  end

  def get_gender_error_msg
    find(GENDER_ERROR_MSG).text
  end
end
