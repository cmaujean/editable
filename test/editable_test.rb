require 'test_helper'

class EditableTest < ActiveSupport::TestCase
  test "adds an acts_as_editable method to ActiveRecord::Base" do
    assert_respond_to ActiveRecord::Base, :acts_as_editable
  end
  
  test "A model can call acts_as_editable" do
    assert_nothing_raised { BigPig.create(:body => "You can be a big pig too! Oy!") }
  end
  
  test "an editable field has an associated source relation" do
    # note: BigPig calls 'acts_as_editable :body' 
    assert_kind_of Editable::Source, BigPig.create(:body => "You can be a big pig too! Oy!").body_source
  end
end
