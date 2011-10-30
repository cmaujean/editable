require 'spec_helper'

describe Editable do
  it "adds an acts_as_editable method to ActiveRecord::Base" do
    ActiveRecord::Base.should respond_to(:acts_as_editable)
  end

  describe "Editable model" do
    it "can call acts_as_editable" do
      lambda { BigPig.create(:body => "You can be a big pig too! Oy!") }.should_not raise_error
    end

    it "has a class accessor called editable_source_fields" do
      BigPig.should respond_to :editable_source_fields
    end

    it "has field names in editable_source_fields" do
      BigPig.editable_source_fields.keys.include?(:body).should be_true
    end

    it "has processor names in editable_source fields" do
      BigPig.new(:body => "You can be a big pig too! Oy!").editable_source_fields[:body].should == :textile
    end

    describe "editable field" do
      it "has an associated source relation" do
        # note: BigPig calls 'acts_as_editable :body'
        BigPig.create(:body => "You can be a big pig too! Oy!").body_source.should be_kind_of Editable::Source
      end
  
      it "saves the editable fields to the source relations" do
        source_text = "Aaaare you achin' foooor some bacon?"
        pumba = BigPig.create(:body => source_text)
        pumba.body_source.editable_data.should == source_text
      end
    end
    context "when saving editable models" do
      it "processes the editable source relations and saves the processor output to the editable fields" do
        source_text = "h1. Come on down and dine on this tasty swine all you have to do is get in line."
        pumba = BigPig.create(:body => source_text)
        pumba.body.should == "<h1>Come on down and dine on this tasty swine all you have to do is get in line.</h1>"
        pumba.body_source.editable_data.should == source_text
      end
    end
  end
end
