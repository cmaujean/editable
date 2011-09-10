require 'test_helper'

class EditorForHelperTest < ActionView::TestCase
  def setup
    @text = "<% @pig = BigPig.new %><%= form_for @pig do |f| %><%= raw editor(@pig, :body, {:cols => 50, :rows => 20}) %><%=f.text_field :id%><% end %>"
    render :inline => @text
    # $stderr.puts @rendered
  end
  test "editor returns a textarea tag tied to the form instance" do
    assert_select('form#new_big_pig > textarea#big_pig_body')
  end
  
  test "editor options are passed through as attributes" do
    assert_select('textarea[cols=50]')
    assert_select('textarea[rows=20]')
  end
  
  test "when the editable source does not have assets there are no assets provided" do
    assert_select('script', false)
  end
end