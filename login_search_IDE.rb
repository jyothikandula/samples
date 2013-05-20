require "selenium-webdriver"
gem "test-unit"
require "test/unit"


class LoginSearchIDE < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://thirdrevolution-staging.herokuapp.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_login_search_i_d_e
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Sign In").click
	@driver.find_element(:id, "user_email").clear
	@driver.find_element(:id, "user_email").send_keys "jyothi_kandula@yahoo.com"
	@driver.find_element(:id, "user_password").clear
	@driver.find_element(:id, "user_password").send_keys "jyothi"
	
    # ERROR: Caught exception [Error: locator strategy either id or name must be specified explicitly.]
    # ERROR: Caught exception [Error: locator strategy either id or name must be specified explicitly.]
    @driver.find_element(:css, "#signin-body > form > input[name=\"commit\"]").click
    @driver.find_element(:id, "q").clear
    @driver.find_element(:id, "q").send_keys "quilt"
    @driver.find_element(:name, "commit").click
    # Warning: verifyTextPresent may require manual changes
    #verify { assert_match /^[\s\S]*298 projects[\s\S]*$/, @driver.find_element(:css, "BODY").text }
	assert_match( "298 projects", @driver.find_element(:css, "BODY").text, "298 projects found is correct")
    @driver.find_element(:link, "home").click
    @driver.find_element(:link, "logout").click
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert.text
  ensure
    @accept_next_alert = true
  end
end
