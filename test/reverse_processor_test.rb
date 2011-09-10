require 'test_helper'
require 'editable/processors/reverse'

class EditableProcessorsReverseTest < ActiveSupport::TestCase
  def setup
    @processor = Editable::Processors::Reverse.new
  end
  
  test "it has a process() method" do
    assert_respond_to @processor, :process
  end
  
  test "it returns the reverse of the text passed in" do
    text = "Luau! If you're hungry for a hunk of fat and juicy meat eat my buddy Pumbaa here because he is a treat."
    reversed = ".taert a si eh esuaceb ereh aabmuP yddub ym tae taem yciuj dna taf fo knuh a rof yrgnuh er'uoy fI !uauL"
    assert_equal @processor.process(text), reversed
  end
  
  test "it has an assets? method" do
    assert_respond_to @processor, :assets?
  end
  
  # Reverse has no assets, so therefore #assets should return false 
  test "its assets method returns false" do
    assert_equal @processor.assets?, false
  end
  
  test "it has a name method that returns :reverse" do
    assert_equal @processor.name, :reverse
  end
end