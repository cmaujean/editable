require 'test_helper'
require 'editable/processors/textile'

class EditableProcessorsTextileTest < ActiveSupport::TestCase
  def setup
    @processor = Editable::Processors::Textile.new
  end
  
  test "it has a process() method" do
    assert_respond_to @processor, :process
  end
  
  test "it returns processed html from the textile passed in" do
    text = "h1. Luau!

     If you're hungry for a hunk of fat
     and juicy meat eat my buddy *Pumbaa* here because he is a _treat_."
    processed = "<h1>Luau!</h1>\nIf you&#8217;re hungry for a hunk of fat\nand juicy meat eat my buddy <strong>Pumbaa</strong> here because he is a <em>treat</em>."
    assert_equal processed, @processor.process(text)
  end
  
  test "it has an assets method" do
    assert_respond_to @processor, :assets
  end
  
  # Textile has no assets, so therefore #assets should return false 
  test "assets method returns false" do
    assert_equal @processor.assets, false
  end
  
  test "it has a name method that returns :textile" do
    assert_equal @processor.name, :textile
  end
end