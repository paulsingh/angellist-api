require 'spec_helper'

describe AngellistApi do
  
  describe ".new" do
    it "should be an alias for AngellistApi::Client.new" do
      options = { :some => "option" }
      AngellistApi.new(options).class.name.should == "AngellistApi::Client"
    end
  end
  
  describe ".method_missing" do
    context "with a method known to AngellistApi::Client" do
      it "should pass the method call to AngellistApi::Client" do
        expected_result = {:some => "result"}
        AngellistApi::Client.any_instance.expects(:startup_search).returns(expected_result)
        lambda { AngellistApi.startup_search(:slug => 'angellist').should == expected_result }.should_not raise_error
      end
    end
    
    context "with a method unknown to AngellistApi::Client" do
      it "should raise method not found error" do
        lambda { AngellistApi.some_unknown_method }.should raise_error(NoMethodError)
      end
    end
  end
  
  describe ".respond_to?" do
    it "should return true if AngellistApi::Client responds to the method" do
      AngellistApi.respond_to?(:startup_search).should be_true
    end
    
    it "should return false if AngellistApi::Client does not respond to the method" do
      AngellistApi.respond_to?(:some_unknown_method).should be_false
    end
  end

end