require 'redcarpet'
module Editable
  module Processors
    class Markdown
      def process(text)
        Redcarpet.new(text).to_html
      end
      
      def assets?
        false
      end
      
      def assets
        ""
      end
      
      def name
        :markdown
      end
    end
  end
end