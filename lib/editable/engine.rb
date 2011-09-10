require 'editable'

module Editable
  class Engine < Rails::Engine
    rake_tasks do |app|
      app.load 'lib/tasks/editable_tasks.rake'
    end
    initializer 'editable.helper' do |app|
      ApplicationController.send :include, EditableHelper
    end
  end
end
