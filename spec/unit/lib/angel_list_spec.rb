require 'spec_helper'

describe AngelList do

  describe ".new" do
    it "is an alias for AngelList::Client.new" do
      options = { :some => "option" }
      AngelList.new(options).class.name.should == "AngelList::Client"
    end
  end

  describe ".method_missing" do
    context "with a method known to AngelList::Client" do
      it "passes the method call to AngelList::Client" do
        expected_result = {:some => "result"}
        AngelList::Client.any_instance.should_receive(:startup_search).
          and_return(expected_result)

        expect do
          AngelList.startup_search(:slug => 'angellist').should == expected_result
        end.to_not raise_error
      end
    end

    context "with a method unknown to AngelList::Client" do
      it "raises method not found error" do
        expect { AngelList.some_unknown_method }.to raise_error(NoMethodError)
      end
    end
  end

  describe ".respond_to?" do
    it "returns true if AngelList::Client responds to the method" do
      AngelList.respond_to?(:startup_search).should be_true
    end

    it "returns false if AngelList::Client does not respond to the method" do
      AngelList.respond_to?(:some_unknown_method).should be_false
    end
  end

end
