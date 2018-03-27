require 'capybara/dsl'

class BBC_DOB_Page
  include Capybara::DSL

  DAY_NAME = "dateOfBirthDay"
  MONTH_NAME = "dateOfBirthMonth"
  YEAR_NAME = "dateOfBirthYear"
  DOB_ERROR_ID = "#form-message-dateOfBirth"
  SUBMIT_BUTTON_TEXT = "#submit-button"

  def set_day_value day
    fill_in DAY_NAME, with: day
  end

  def set_month_value month
    fill_in MONTH_NAME, with: month
  end

  def set_year_value year
    fill_in YEAR_NAME, with: year
  end

  def get_dob_error_msg
    find(DOB_ERROR_ID).text
  end

  def select_submit_link
    find(SUBMIT_BUTTON_TEXT).click
  end

end
