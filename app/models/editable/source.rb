class Editable::Source < ActiveRecord::Base
  belongs_to :editable, :polymorphic => true
  set_table_name do
    "editable_sources"
  end
  
  ASSETS = { :bogus => "bogus editor assets for testing"}
  
  def editor_assets
    ASSETS[self.processor] or ""
  end
end
