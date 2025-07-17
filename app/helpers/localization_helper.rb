# frozen_string_literal: true

module LocalizationHelper
  def localized_country_code(country_code)
    I18n.t("spree.#{country_code.to_s.downcase}")
  end
end
