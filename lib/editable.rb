require "editable/engine"
require 'editable/processors'

module Editable
  module ActsAsEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_editable(field, options={})
        
        cattr_accessor :editable_processor
        self.editable_processor = options[:processor] || :reverse
        
        cattr_accessor :editable_source_fields
        self.editable_source_fields ||= [] 
        self.editable_source_fields << field
        has_one "#{field.to_s}_source".to_sym, :as => :editable, :class_name => "Editable::Source", :dependent => :destroy
        after_initialize :ensure_editable_sources
        before_validation :process_editable_sources
      end
    end
    
    def ensure_editable_sources
      self.editable_source_fields.each do |f|
        self.send("create_#{f.to_s}_source".to_sym, :editable_field => f, :processor => self.editable_processor)
      end
    end
    
    def process_editable_sources
      self.editable_source_fields.each do |f|
        self.send("#{f.to_s}_source").editable_data = self.send("#{f.to_s}")
        self.send("#{f.to_s}=", self.send("#{f.to_s}_source").process!)
      end
    end
  end
end

ActiveRecord::Base.send :include, Editable::ActsAsEditable