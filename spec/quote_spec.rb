require_relative '../lib/beebot/quote'

describe BeeBot::Quote do
  let(:quote_path) { "#{Dir.pwd}/spec/images/quote_nickname_at_school.png" }
  let(:non_quote_path) { "#{Dir.pwd}/spec/images/a_capybara.jpg" }

  it 'stores the path' do
    quote = BeeBot::Quote.new(quote_path)
    quote.path.should == quote_path
  end

  it 'extract a name from the filename' do
    quote = BeeBot::Quote.new(quote_path)
    quote.name.should == 'Nickname at school'
  end

  it 'validates the quote file' do
    expect { BeeBot::Quote.new(non_quote_path) }.to raise_error BeeBot::Quote::Invalid
  end
end
