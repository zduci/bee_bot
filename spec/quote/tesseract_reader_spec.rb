require_relative '../../lib/bee_bot/quote/tesseract_reader'
require_relative '../../lib/bee_bot/quote/image'

describe BeeBot::Quote::TesseractReader do
  let(:path) { 'a_quote.png' }
  let(:quote) { BeeBot::Quote::Image.new(path, 'A quote') }
  let(:engine) { double(:engine) }
  let(:text) { 'One original thought is worth a thousand mindless quotings.' }

  it 'reads the text using tesseract' do
    Tesseract::Engine.should_receive(:new).and_return(engine)
    engine.should_receive(:text_for).with(path).and_return(text)
    BeeBot::Quote::TesseractReader.read(quote).should == text
  end
end
