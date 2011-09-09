class Editable::Source < ActiveRecord::Base
  belongs_to :editable, :polymorphic => true
  
  def process!
    pr = "Editable::Processors::#{self.processor.to_s.camelize}".constantize.new
    return pr.process(self.editable_data)
  end
end
