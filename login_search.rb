require 'rubygems'
require "test/unit"
require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "https://thirdrevolution-staging.herokuapp.com/"
wd.find_element(:link_text, "Sign In").click
wd.find_element(:id, "user_email").click
wd.find_element(:id, "user_email").clear
wd.find_element(:id, "user_email").send_keys "jyothi_kandula@yahoo.com"
wd.find_element(:id, "user_password").click
wd.find_element(:id, "user_password").clear
wd.find_element(:id, "user_password").send_keys "jyothi"
wd.find_element(:xpath, "//div[@id='signin-body']/form/input").click
wd.find_element(:id, "q").click
wd.find_element(:id, "q").clear
wd.find_element(:id, "q").send_keys "cars"
#wd.find_element(:name, "commit").click
#if wd.find_element(:tag_name, "html").text.include? not "54 projects"
#    print "verifyTextPresent failed"
#end
#wd.find_element(:id, "nav").click
wd.find_element(:link_text, "home").click
#wd.find_element(:link_text, "logout").click
wd.quit
