module Spree
  module Themes
    class HappyParentsTheme < Default
      def self.metadata
        {
          authors: ['Your Name'],
          license: 'MIT',
        }
      end

      def custom_page_sections
        # you can override this method in your theme to return a list of custom page sections for your theme
        # [Spree::PageSections::Custom, Spree::PageSections::Custom2]
        []
      end
    end
  end
end
