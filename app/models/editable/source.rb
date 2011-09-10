class Editable::Source < ActiveRecord::Base
  belongs_to :editable, :polymorphic => true
  def get_processor
    @pr ||= "Editable::Processors::#{self.processor.to_s.camelize}".constantize.new
    @pr
  end
  def process!
    return get_processor.process(self.editable_data)
  end
end
