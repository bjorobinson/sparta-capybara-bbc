require_relative 'pages/BBC_Homepage'
require_relative 'pages/BBC_Login'
require_relative 'pages/BBC_Age_Page'
require_relative 'pages/BBC_DOB_Page'
require_relative 'pages/BBC_Details_Page'

class BBC_Site

  def bbc_homepage
    BBC_Homepage.new
  end

  def bbc_login
    BBC_Login.new
  end

  def bbc_age_page
    BBC_Age_Page.new
  end

  def bbc_dob_page
    BBC_DOB_Page.new
  end

  def bbc_details_page
    BBC_Details_Page.new
  end

  def get_URL
    URI.parse(current_url).to_s
  end

end
