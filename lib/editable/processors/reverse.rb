module Editable
  module Processors
    class Reverse
      
      def process(text)
        return text.reverse
      end
      
      def assets
        false
      end
      
      def name
        :reverse
      end
    end
  end
end