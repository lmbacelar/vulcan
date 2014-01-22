Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When /^I POST to "([^\"]*)" with:$/ do |path, body|
  post path, body
end

Then /^the response status should be "([^\"]*)"$/ do |status|
  begin
    expect(last_response.status).to eq status.to_i
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response Body"
    puts last_response.body
    raise e
  end 
end

Then /^DEBUG$/ do
  debugger
end
