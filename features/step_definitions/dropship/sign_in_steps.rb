Given(/^I am on dropship landing page$/) do
  visit '/'
  within('.page-brand-info') do
    find('p').has_content?('Welcome to our dropship platform')
  end
end

When(/^I click on Sign in link I should see the sign in form$/) do
  # click_link 'Sign In'
  # find('h3').has_content?('Sign In')
end

And(/^I fill in the invalid email password combination and hit Sign In$/) do
  # fill_in('#spree_user_email', with: 'test_user@example.com')
  # fill_in('#spree_user_password', with: 'test12345')
  # click_button 'Sign in'
end

Then(/^I should see the error message$/) do
  # find('.alert-danger').has_content?('Invalid Email or password.')
end
