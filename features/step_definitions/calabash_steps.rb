require 'calabash-android/calabash_steps'

Given(/^I am on the Login screen$/) do
  wait_for_activity("MainActivity", timeout: 5)
  raise 'Login button not found' if query("* marked:'loginButton' {text CONTAINS[c] 'Login'}").empty?
  check_element_exists("* marked:'loginButton'")
end

When(/^I enter my credentials (\S*) and (\S*)$/) do | login, password |
  enter_text("* marked:'emailEditTextView'", login)
  enter_text("* marked:'passwordEditTextView'", password)
end

When(/^I press login button$/) do
  tap_when_element_exists("* marked:'loginButton'")
end

Then(/^I see Logged screen$/) do
  wait_for_activity("LoggedActivity", timeout: 5)
end