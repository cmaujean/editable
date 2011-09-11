require 'editable'

module Editable
  class Engine < Rails::Engine
    initializer 'editable.helper' do |app|
      ApplicationController.send :include, EditableHelper
    end
  end
end
