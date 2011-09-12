require 'test_helper'

class Editable::SourceTest < ActiveSupport::TestCase
  def setup
    @src_data = "just eat my buddy pumba here"
    @src = Editable::Source.new(:editable_data => @src_data, :editable_field => :bacon, :processor => :textile)
  end
  
  test "a source can be instatiated" do
    assert_kind_of Editable::Source, @src
  end
  
  test "a source has an editable_data field" do
    assert_respond_to @src, :editable_data
  end
  
  test "source#editable_data returns a string" do
    assert_kind_of String, @src.editable_data
  end
    
  test "a source has an editable_field field" do
    assert_respond_to @src, :editable_field
  end
  test "source#editable_field returns a symbol" do
    assert_kind_of Symbol, @src.editable_field
  end
    
  test "a source has a processor" do
    assert_kind_of Symbol, @src.processor
  end
  
  test "a source provides assets for a given editor when assets exist" do
    src_bogus = Editable::Source.new(:editable_data => @src_data, :editable_field => :bacon, :processor => :bogus)
    assert_equal "bogus editor assets for testing", src_bogus.editor_assets
  end
  
  test "a source does not provide assets for a given editor when the assets do not exist" do
    assert_equal "", @src.editor_assets
  end
end
