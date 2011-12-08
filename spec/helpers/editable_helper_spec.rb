require_relative '../spec_helper'

describe EditableHelper do
    before :each do
      @no_assets_text = "<% @pig = BigPig.new %><%= form_for @pig do |f| %><%= raw editor(@pig, :body, {:cols => 50, :rows => 20}) %><%=f.text_field :id%><% end %>"
      @assets_text = "<% @kat = MeerKat.new %><%= form_for @kat do |f| %><%= raw editor(@kat, :body, {:cols => 50, :rows => 20}) %><%=f.text_field :id%><% end %>"
    end

    it "returns a textarea tag tied to the form instance" do
      str = render :inline => @no_assets_text
      str.should have_selector('form#new_big_pig') do |form|
         form.should have_selector('textarea#big_pig_body')
      end
    end

    it "passes options through as attributes" do
      str = render :inline => @no_assets_text
      str.should have_selector("textarea[cols='50']")
      str.should have_selector("textarea[rows='20']")
    end
  context "when the editable source has related assets" do
    it "provides assets" do
      str = render :inline => @assets_text
      str.should have_selector('script')
    end
  end
  context "when the editable source does not have assets" do
    it "does not provide assets" do
      str = render :inline => @no_assets_text
      str.should_not have_selector('script')
    end
  end
end