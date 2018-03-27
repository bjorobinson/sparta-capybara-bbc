require 'capybara/dsl'

class BBC_Homepage
  include Capybara::DSL

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "#idcta-username"

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def click_sign_in_link
    sign_in_link.click
  end

end
