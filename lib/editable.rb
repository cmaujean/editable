require 'editable/engine'
require 'github/markup'

module Editable
  module ActsAsEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_editable(field, processor, options={})
        cattr_accessor :editable_source_fields
        self.editable_source_fields ||= {} 
        self.editable_source_fields[field] = processor
        has_one "#{field.to_s}_source".to_sym, :as => :editable, :class_name => "Editable::Source", :dependent => :destroy, :autosave => true
        after_initialize :ensure_editable_sources
        before_validation :process_editable_sources
      end
    end
    
    def ensure_editable_sources
      self.editable_source_fields.each do |f,p|
        f_source = "#{f.to_s}_source"
        self.send("#{f_source}=", Editable::Source.new(:editable_field => f, :processor => p)) if self.send(f_source).blank?
      end
    end
    
    def process_editable_sources
      self.editable_source_fields.each do |f,p|
        f_source = "#{f.to_s}_source"
        self.send(f_source).editable_data = self.send("#{f}")
        self.send("#{f.to_s}=", GitHub::Markup.render(".#{self.send(f_source).processor.to_s}", self.send(f_source).editable_data))
      end
    end
      
  end
end

ActiveRecord::Base.send :include, Editable::ActsAsEditable