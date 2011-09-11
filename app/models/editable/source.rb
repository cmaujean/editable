class Editable::Source < ActiveRecord::Base
  belongs_to :editable, :polymorphic => true
  set_table_name do
    "editable_sources"
  end
  
  def get_processor
    @pr ||= "Editable::Processors::#{self.processor.to_s.camelize}".constantize.new
    @pr
  end
  def process!
    return get_processor.process(self.editable_data)
  end
end
