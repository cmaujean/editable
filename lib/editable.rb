require "editable/engine"

module Editable
  module ActsAsEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_editable(field, options={})
      end
    end
  end
end

ActiveRecord::Base.send :include, Editable::ActsAsEditable
