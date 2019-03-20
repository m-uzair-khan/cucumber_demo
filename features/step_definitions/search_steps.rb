Given(/^I am on google UK$/) do
  # visit method goes to google.co.uk the specified Capybara.app_host in env.rb
  # visit '/'
end

Given(/^I search for cucumber$/) do
  # fill the cucumber search box
  fill_in 'gLFyf', :with => 'cucumber'
  # click on the google search button
  click_button 'Google Search'
end

Then(/^I should be able to access the cucumber wiki page$/) do
  # use xpath to find the link we require and click it
  # find(:xpath, "//a[contains(.,'Cucumber - Wikipedia, the free encyclopedia')]").click
  # test the h1 title is equal to Cucumber
  # find('h1').text == 'Cucumber'
end
