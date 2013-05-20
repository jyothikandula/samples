require 'rubygems'
require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "https://www.3rdrevolution.com/"
wd.find_element(:link_text, "Sign In").click
wd.find_element(:xpath, "//div[@id='signin-body']/form/input").click
wd.find_element(:id, "q").click
wd.find_element(:id, "q").clear
wd.find_element(:id, "q").send_keys "cars"
wd.find_element(:name, "commit").click
if wd.find_element(:tag_name, "html").text.include? not "19 projects"
    print "verifyTextPresent failed"
end
wd.quit
