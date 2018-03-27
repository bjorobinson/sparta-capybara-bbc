require 'capybara/dsl'

class BBC_Age_Page
  include Capybara::DSL

  BUTTON_13_AND_OVER = "13 or over"

  def select_13_and_over
    click_link(BUTTON_13_AND_OVER)
  end
end
