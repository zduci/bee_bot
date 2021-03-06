require_relative '../../lib/bee_bot/quote/image'

describe BeeBot::Quote::Image do
  let(:path) { 'a_quote.png' }
  let(:name) { 'A path' }

  it 'stores a path and name' do
    quote = BeeBot::Quote::Image.new(path, name)
    quote.path.should == path
    quote.name.should == name
  end

  describe '::from_path' do
    let(:quote_path) { "#{Dir.pwd}/spec/images/quote_nickname_at_school.png" }
    let(:non_quote_path) { "#{Dir.pwd}/spec/images/a_capybara.jpg" }

    it 'stores the path' do
      BeeBot::Quote::Validator.should_receive(:valid?).with(quote_path).and_return true
      quote = BeeBot::Quote::Image.from_path(quote_path)
      quote.path.should == quote_path
    end

    it 'extract a name from the filename' do
      BeeBot::Quote::Validator.should_receive(:valid?).with(quote_path).and_return true
      quote = BeeBot::Quote::Image.from_path(quote_path)
      quote.name.should == 'Nickname at school'
    end

    it 'validates the quote file' do
      BeeBot::Quote::Validator.should_receive(:valid?).with(non_quote_path).and_return false
      expect { BeeBot::Quote::Image.from_path(non_quote_path) }.to raise_error BeeBot::Quote::Image::Invalid
    end
  end
end
