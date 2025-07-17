# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocalizationHelper do
  describe '#localized_country_code' do
    context 'when locale is :uk' do
      before { I18n.locale = :uk }

      it 'returns correct localization for :uk' do
        [:uk, 'uk'].each do |code|
          expect(helper.localized_country_code(code)).to eq('Укр')
        end
      end

      it 'returns correct localization for :ru' do
        [:ru, 'ru'].each do |code|
          expect(helper.localized_country_code(code)).to eq('Рус')
        end
      end
    end

    context 'when locale is :ru' do
      before { I18n.locale = :ru }

      it 'returns correct localization for :uk' do
        [:uk, 'uk'].each do |code|
          expect(helper.localized_country_code(code)).to eq('Укр')
        end
      end

      it 'returns correct localization for :ru' do
        [:ru, 'ru'].each do |code|
          expect(helper.localized_country_code(code)).to eq('Рус')
        end
      end
    end
  end
end
