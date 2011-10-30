require_relative '../../spec_helper'

describe Editable::Source do
  before :each do
    @src_data = "just eat my buddy pumba here"
    @src = Editable::Source.new(:editable_data => @src_data, :editable_field => :bacon, :processor => :textile)
  end
  
  it "can be instantiated" do
    @src.should be_kind_of(Editable::Source)
  end
  
  it "has an editable_data field" do
    @src.should respond_to(:editable_data)
  end
  context "#editable_data" do
    it "returns a string" do
      @src.editable_data.should be_kind_of(String)
    end
  end
    
  it "has an editable_field field" do
    @src.should respond_to(:editable_field)
  end

  context "#editable_field" do
    it "returns a symbol" do
      @src.editable_field.should be_kind_of(Symbol)
    end
  end
    
  it "has a processor" do
    @src.processor.should be_kind_of(Symbol)
  end
  
  it "provides assets for a given editor when assets exist" do
    src_bogus = Editable::Source.new(:editable_data => @src_data, :editable_field => :bacon, :processor => :bogus)
    src_bogus.editor_assets.should == "bogus editor assets for testing"
  end
  
  it "does not provide assets for a given editor when the assets do not exist" do
    @src.editor_assets.should == ""
  end

end
