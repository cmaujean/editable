require 'test_helper'
require 'editable/processors/markdown'

class EditableProcessorsMarkdownTest < ActiveSupport::TestCase
  def setup
    @processor = Editable::Processors::Markdown.new
  end
  
  test "it has a process() method" do
    assert_respond_to @processor, :process
  end
  
  test "it returns processed html from the markdown passed in" do
    text = "Luau!
=====

If you're hungry for a hunk of fat
and juicy meat eat my buddy *Pumbaa* here because he is a _treat_."
    processed = "<h1>Luau!</h1>

<p>If you're hungry for a hunk of fat
and juicy meat eat my buddy <em>Pumbaa</em> here because he is a <em>treat</em>.</p>
"
    assert_equal processed, @processor.process(text)
  end
  
  test "it has an assets method" do
    assert_respond_to @processor, :assets
  end
  
  # Markdown has no assets, so therefore #assets should return an empty string
  test "assets method returns an empty string" do
    assert_equal @processor.assets, ""
  end
  
  test "it has an assets? method" do
    assert_equal @processor.assets?, false
  end
  
  test "it has a name method that returns :markdown" do
    assert_equal @processor.name, :markdown
  end
end