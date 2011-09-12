require 'test_helper'

class EditableTest < ActiveSupport::TestCase
  test "adds an acts_as_editable method to ActiveRecord::Base" do
    assert_respond_to ActiveRecord::Base, :acts_as_editable
  end
  
  test "A model can call acts_as_editable" do
    assert_nothing_raised { BigPig.create(:body => "You can be a big pig too! Oy!") }
  end
  
  test "an editable model has a class accessor called editable_source_fields" do
    assert_respond_to BigPig, :editable_source_fields
  end
  
  test "an editable model has field names in editable_source_fields" do
    assert BigPig.editable_source_fields.keys.include? :body
  end
  
  test "an editable model has processor names in editable_source fields" do
    assert_equal :textile, BigPig.new(:body => "You can be a big pig too! Oy!").editable_source_fields[:body]
  end
  
  test "an editable field has an associated source relation" do
    # note: BigPig calls 'acts_as_editable :body' 
    assert_kind_of Editable::Source, BigPig.create(:body => "You can be a big pig too! Oy!").body_source
  end
  
  test "when saving editable models the editable fields are saved to the source relations" do
    source_text = "Aaaare you achin' foooor some bacon?"
    pumba = BigPig.create(:body => source_text)
    assert pumba.body_source.editable_data == source_text, "source field is saved to the relation"
  end
  
  test "when saving editable models the editable source relations are processed and saved to the editable fields" do
    source_text = "h1. Come on down and dine on this tasty swine all you have to do is get in line."
    pumba = BigPig.create(:body => source_text)
    assert pumba.body == "<h1>Come on down and dine on this tasty swine all you have to do is get in line.</h1>", "processing works"
    assert pumba.body_source.editable_data == source_text, "source editable_data is still the source"
  end
end
