
module Editable
  module EditorForHelper  
    extend ActiveSupport::Concern

    def editor_for(object_name, method, options = {})
      return "<textarea>#{object_name}: #{method} - #{options.inspect}</textarea>"
    end

  end
end