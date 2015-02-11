require_relative '../lib/beebot/quote_validator'

describe BeeBot::QuoteValidator do
  let(:quote_path) { "#{Dir.pwd}/spec/images/quote_nickname_at_school.png" }
  let(:non_quote_path) { "#{Dir.pwd}/spec/images/a_capybara.jpg" }

  it 'validates quote files' do
    BeeBot::QuoteValidator.valid?(quote_path).should == true
    BeeBot::QuoteValidator.valid?(non_quote_path).should == false
  end
end
