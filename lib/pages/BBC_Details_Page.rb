require 'capybara/dsl'

class BBC_Details_Page
  include Capybara::DSL

  EMAIL_ID = "#email"

  def find_email
    find(EMAIL_ID)['id']
  end
end
