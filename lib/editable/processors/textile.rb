require 'redcloth'
module Editable
  module Processors
    class Textile
      def process(text)
        RedCloth.new(text).to_html
      end
      
      def assets
        false
      end
      
      def name
        :textile
      end
    end
  end
end