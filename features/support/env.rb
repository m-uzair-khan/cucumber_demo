require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.co.uk"
Capybara.register_driver :selenium do |app|
  browser = (ENV['browser'] || 'chrome').to_sym
  Capybara::Selenium::Driver.new app, browser: browser, desired_capabilities: {
      chromeOptions: { args: %w{ --start-maximized } }
  }
end

World(Capybara::DSL)

After do |scenario|
  p 'After Hook ###########'
  ResultUploader.new(scenario).upload_result
end

at_exit do
  p 'global teardown'
end
