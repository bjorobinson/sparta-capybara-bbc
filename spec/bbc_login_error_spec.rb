require "spec_helper"

describe "Incorrect user details produces valid error" do
  context "it should respond with the correct error when incorrect details" do
    # it "should produce an error when inputting an incorrect password to a valid account" do
    #   @bbc_site = BBC_Site.new
    #   @bbc_site.bbc_homepage.visit_home_page
    #   @bbc_site.bbc_homepage.click_sign_in_link
    #   @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk'
    #   @bbc_site.bbc_login.set_password_value 'dummypassword2'
    #   @bbc_site.bbc_login.click_submit_link
    #   expect(@bbc_site.bbc_login.get_password_error_msg).to eq "Uh oh, that password doesn’t match that account. Please try again."
    # end

    # it "should produce an error when inputting an incorrect email with a correct password" do
      # @bbc_site = BBC_Site.new
      # @bbc_site.bbc_homepage.visit_home_page
      # @bbc_site.bbc_homepage.click_sign_in_link
      # @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk1'
      # @bbc_site.bbc_login.set_password_value 'dummy_password1'
      # @bbc_site.bbc_login.click_submit_link
      # expect(@bbc_site.bbc_login.get_username_error_msg).to eq "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    # end

    # it "should produce an error when inputting an incorrect email with an incorrect password" do
      # @bbc_site = BBC_Site.new
      # @bbc_site.bbc_homepage.visit_home_page
      # @bbc_site.bbc_homepage.click_sign_in_link
      # @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk1'
      # @bbc_site.bbc_login.set_password_value 'dummypassword2'
      # @bbc_site.bbc_login.click_submit_link
      # expect(@bbc_site.bbc_login.get_username_error_msg).to eq "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    # end

    # it "should not produce an error when inputting a correct email with a correct password" do
      # @bbc_site = BBC_Site.new
      # @bbc_site.bbc_homepage.visit_home_page
      # @bbc_site.bbc_homepage.click_sign_in_link
      # @bbc_site.bbc_login.set_username_value 'e1858789@nwytg.com'
      # @bbc_site.bbc_login.set_password_value 'dummy_password1'
      # @bbc_site.bbc_login.click_submit_link
      # expect(@bbc_site.get_URL).to eq "https://www.bbc.co.uk/"
    # end

  end
end

describe "Full Registration Process" do
  context "It should return the correct errors on invalid inputs throughout the registration process" do
    it "should return correct error on the date of birth page when day given is not a valid number" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
      @bbc_site.bbc_dob_page.set_day_value "Q"
      @bbc_site.bbc_dob_page.set_month_value "7"
      @bbc_site.bbc_dob_page.set_year_value "1996"
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that day doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "should correct error on the date of birth page when month given is not a valid number" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
      @bbc_site.bbc_dob_page.set_day_value "6"
      @bbc_site.bbc_dob_page.set_month_value "Q"
      @bbc_site.bbc_dob_page.set_year_value "1996"
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that month doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "should return an error on the date of birth page when day given is not a valid number" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
      @bbc_site.bbc_dob_page.set_day_value "6"
      @bbc_site.bbc_dob_page.set_month_value "7"
      @bbc_site.bbc_dob_page.set_year_value "Q"
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "should return an error on the date of birth page when year given is in the future" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
      @bbc_site.bbc_dob_page.set_day_value "6"
      @bbc_site.bbc_dob_page.set_month_value "7"
      @bbc_site.bbc_dob_page.set_year_value "2023"
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that date's in the future. Make sure it’s a date in the past. (Unless you’re a time traveller. In which case, what’s the future like? Are there flying cars?)"
    end

  end
end
