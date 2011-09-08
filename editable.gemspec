$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "editable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "editable"
  s.version     = Editable::VERSION
  s.authors     = ["Christopher Maujean", "Day Waterbury"]
  s.email       = ["christopher@azimuthonline.com", "day@azimuthonline.com"]
  s.homepage    = "http://azimuthonline.com/"
  s.summary     = "Assosiate any js based wysiwig editor or markup language processor to a field (or fields) in a model."
  s.description = "
  Associate a set of possible editors/markup language processors with a field or fields on a model. A helper 
  is provided for displaying the proper editor or a textarea (for markup languages).
  
  class BlogPost << ActiveRecord::Base
    acts_as_editable :body, {:default_type => :textile, :allowed_types => [:textile, :markdown, :wymeditor]}
  end
  
  # in a view...
  <%= form_for @post do |f| %>
    ...
    <%= f.editor_for :body {:allow_switch => true}%>
    ...
  <% end %>
  "

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
