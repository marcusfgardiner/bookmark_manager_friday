require 'link'

describe Link do

  describe '::all' do

    # it 'returns all links' do
    #   links = described_class.all
    #   expect(links).to include(['http://www.makersacademy.com'])
    #   expect(links).to include(['http://www.google.com'])
    #   expect(links).to include(['http://www.facebook.com'])
    # end

    it 'returns an array of objects that are instances of Link' do
      expect(described_class.all[0]).to be_an_instance_of described_class
    end
  end

  it 'returns the ID of a link object' do
    expect(described_class.all[0].id).to be > 0
  end

  it 'returns the URL of a link object' do
    expect(described_class.all[0].url).to eq("http://www.makersacademy.com")
  end

  describe '::add' do
    context 'user inputs invalid URL' do
      it 'raises error' do
        message = 'This is not a valid URL'
        expect { described_class.add(345) }.to raise_error(message)
      end
    end

    it 'creates a new link' do
      described_class.add('https://www.instagram.com')
      expect(described_class.all[-1].url).to eq('https://www.instagram.com')
    end
  end
end
