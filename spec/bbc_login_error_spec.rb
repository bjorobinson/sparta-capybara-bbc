require "spec_helper"

describe "Incorrect user details produces valid error" do
  context "it should respond with the correct error when incorrect details" do
    it "should produce an error when inputting an incorrect password to a valid account" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk'
      @bbc_site.bbc_login.set_password_value 'dummypassword2'
      @bbc_site.bbc_login.click_submit_link
      expect(@bbc_site.bbc_login.get_password_error_msg).to eq "Uh oh, that password doesn’t match that account. Please try again."
    end

    it "should produce an error when inputting an incorrect email with a correct password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk1'
      @bbc_site.bbc_login.set_password_value 'dummy_password1'
      @bbc_site.bbc_login.click_submit_link
      expect(@bbc_site.bbc_login.get_username_error_msg).to eq "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    end

    it "should produce an error when inputting an incorrect email with an incorrect password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.set_username_value 'benjrob@live.co.uk1'
      @bbc_site.bbc_login.set_password_value 'dummypassword2'
      @bbc_site.bbc_login.click_submit_link
      expect(@bbc_site.bbc_login.get_username_error_msg).to eq "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    end

    it "should not produce an error when inputting a correct email with a correct password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.set_username_value 'e1858789@nwytg.com'
      @bbc_site.bbc_login.set_password_value 'dummy_password1'
      @bbc_site.bbc_login.click_submit_link
      expect(@bbc_site.get_URL).to eq "https://www.bbc.co.uk/"
    end

  end
end

describe "Full Registration Process" do
  context "It should return the correct errors on invalid inputs on Date of Birth Page" do
    before(:each) do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
    end

    it "when day given is not a valid number" do
      @bbc_site.bbc_dob_page.set_dob_values ["Q","7","1996"]
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that day doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "when month given is not a valid number" do
      @bbc_site.bbc_dob_page.set_dob_values ["6","Q","1996"]
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that month doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "when year given is not a valid number" do
      @bbc_site.bbc_dob_page.set_dob_values ["6","7","Q"]
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "when year given is in the future" do
      @bbc_site.bbc_dob_page.set_dob_values ["6","7","2023"]
      @bbc_site.bbc_dob_page.select_submit_link
      expect(@bbc_site.bbc_dob_page.get_dob_error_msg).to eq "Oops, that date's in the future. Make sure it’s a date in the past. (Unless you’re a time traveller. In which case, what’s the future like? Are there flying cars?)"
    end

    it "should return no error message and move to the next part of the signup when valid numbers for date of birth are provided" do
      @bbc_site.bbc_dob_page.set_dob_values ["6","7","1996"]
      @bbc_site.bbc_dob_page.select_submit_link
      # Test to find if bot has landed on the first page - tries to find the email field. Admittedly this is an arbitrary check
      expect(@bbc_site.bbc_details_page.find_email).to eq 'email'
    end
  end

  context "It should return the correct errors on invalid inputs on Details Page" do
    before(:each) do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_sign_up_link
      @bbc_site.bbc_age_page.select_13_and_over
      @bbc_site.bbc_dob_page.set_dob_values ["6","7","1996"]
      @bbc_site.bbc_dob_page.select_submit_link
    end

    it "when password field is empty" do
      @bbc_site.bbc_details_page.set_password_value " "
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_password_error_msg).to eq "Sorry, that password is too short. It needs to be eight characters or more."
    end

    it "when password is too short" do
      @bbc_site.bbc_details_page.set_password_value "pass"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_password_error_msg).to eq "Sorry, that password is too short. It needs to be eight characters or more."
    end

    it "when password doesn't contain a letter" do
      @bbc_site.bbc_details_page.set_password_value "12345678"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_password_error_msg).to eq "Sorry, that password isn't valid. Please include a letter."
    end

    it "when password only contains letters" do
      @bbc_site.bbc_details_page.set_password_value "password"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_password_error_msg).to eq "Sorry, that password isn't valid. Please include something that isn't a letter."
    end

    it "when password is easy to guess" do
      @bbc_site.bbc_details_page.set_password_value "password1"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_password_error_msg).to eq "Sorry, that password isn't valid. Make sure it's hard to guess."
    end

    it "when postcode is too short" do
      @bbc_site.bbc_details_page.set_postcode_value "TW"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_postcode_error_msg).to eq "Sorry, that postcode's too short. Please check it's a proper postcode."
    end

    it "when postcode doesn't refer to valid postcode" do
      @bbc_site.bbc_details_page.set_postcode_value "TWTW TTT"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_postcode_error_msg).to eq "Sorry, that postcode isn't valid. Please check it's a proper postcode."
    end

    it "when postcode is too long" do
      @bbc_site.bbc_details_page.set_postcode_value "TWTW TWTW"
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_postcode_error_msg).to eq "Sorry, that postcode's too long. Please check it's a proper postcode."
    end

    it "when you do not select a gender" do
      # @bbc_site.bbc_details_page.set_gender_value('0')
      # sleep 5
      @bbc_site.bbc_details_page.submit_form
      expect(@bbc_site.bbc_details_page.get_gender_error_msg).to eq "Something's missing. Please check and try again."
    end
  end
end
