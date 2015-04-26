require 'spec_helper'

describe AngellistApi do

  describe ".new" do
    it "is an alias for AngellistApi::Client.new" do
      options = { :some => "option" }
      AngellistApi.new(options).class.name.should == "AngellistApi::Client"
    end
  end

  describe ".method_missing" do
    context "with a method known to AngellistApi::Client" do
      it "passes the method call to AngellistApi::Client" do
        expected_result = {:some => "result"}
        AngellistApi::Client.any_instance.should_receive(:startup_search).
          and_return(expected_result)

        expect do
          AngellistApi.startup_search(:slug => 'angellist').should == expected_result
        end.to_not raise_error
      end
    end

    context "with a method unknown to AngellistApi::Client" do
      it "raises method not found error" do
        expect { AngellistApi.some_unknown_method }.to raise_error(NoMethodError)
      end
    end
  end

  describe ".respond_to?" do
    it "returns true if AngellistApi::Client responds to the method" do
      AngellistApi.respond_to?(:startup_search).should be true
    end

    it "returns false if AngellistApi::Client does not respond to the method" do
      AngellistApi.respond_to?(:some_unknown_method).should be false
    end
  end

end
