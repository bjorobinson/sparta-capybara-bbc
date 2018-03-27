require 'capybara/dsl'

class BBC_DOB_Page
  include Capybara::DSL

  DAY_ID = "#day-input"
  MONTH_ID = "#month-input"
  YEAR = "#year-input"

  def set_day_value day
    fill_in DAY_ID, with: day
  end

end
