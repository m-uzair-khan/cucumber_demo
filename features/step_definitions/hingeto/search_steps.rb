Given(/^I am on Hingeto homepage$/) do
  visit '/'
end

And(/^I can see the incredible slogan$/) do
  find('.section-hero h1').has_content?('We Help Great Brands and Retailers Grow Their Revenues Online')
end

When(/^I click the Retail Solutions button$/) do
  find('.buttons').click_on('Retail Solutions')
end

Then(/^I should be able to retail solutions page$/) do
  find('header h1').has_content?('Retail Solutions')
end

Then(/^I should be able to access the cucumber wiki page$/) do
  # use xpath to find the link we require and click it
  # find(:xpath, "//a[contains(.,'Cucumber - Wikipedia, the free encyclopedia')]").click
  # test the h1 title is equal to Cucumber
  # find('h1').text == 'Cucumber'
  raise 'Deliberately failed'
end
