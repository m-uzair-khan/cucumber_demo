require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require_relative 'config.rb'

Capybara.default_driver = :selenium
Capybara.app_host = Config.new.config['app_host']
Capybara.register_driver :selenium do |app|
  browser = (ENV['browser'] || 'chrome').to_sym
  Capybara::Selenium::Driver.new app, browser: browser, desired_capabilities: {
      chromeOptions: { args: %w{ --start-maximized } }
  }
end

World(Capybara::DSL)

After do |scenario|
  ResultUploader.new(scenario).upload_result
end

at_exit do
  p 'global teardown'
end
