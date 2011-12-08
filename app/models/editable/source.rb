class Editable::Source < ActiveRecord::Base
  belongs_to :editable, :polymorphic => true
  set_table_name do
    "editable_sources"
  end
  
  ASSETS = { 
    :bogus => "bogus_editor_assets_for_testing.js",
    :wymeditor => "wymeditor.js",
  }
  
  def editor_assets
    Editable::Source::ASSETS[self.processor] or ""
  end
end
