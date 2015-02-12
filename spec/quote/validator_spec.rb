require_relative '../../lib/bee_bot/quote/validator'

describe BeeBot::Quote::Validator do
  let(:quote_path) { "#{Dir.pwd}/spec/images/quote_nickname_at_school.png" }
  let(:non_quote_path) { "#{Dir.pwd}/spec/images/a_capybara.jpg" }

  it 'validates quote files' do
    BeeBot::Quote::Validator.valid?(quote_path).should == true
    BeeBot::Quote::Validator.valid?(non_quote_path).should == false
  end
end
