require 'test_helper'

class EditorForHelperTest < ActiveSupport::TestCase
  test "it has an editor_for method" do
    class Bacon
      include Editable::EditorForHelper
    end
    bacon = Bacon.new
    assert_respond_to bacon, editor_for
  end
end