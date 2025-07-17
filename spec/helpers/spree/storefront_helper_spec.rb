# frozen_string_literal: true

describe Spree::StorefrontHelper, type: :helper do
  describe '#svg_country_icon' do
    it 'returns correct flag class for uk language code' do
      expect(svg_country_icon(['uk', :uk].sample)).to include('fi fi-ua')
    end

    it 'returns correct flag class for en language code' do
      expect(svg_country_icon(['en', :en].sample)).to include('fi fi-us')
    end

    it 'returns correct flag class for ja language code' do
      expect(svg_country_icon(['ja', :ja].sample)).to include('fi fi-jp')
    end

    it 'returns correct flag class for unknown language code' do
      expect(svg_country_icon('fr')).to include('fi fi-fr')
    end
  end
end
