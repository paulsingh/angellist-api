require 'spec_helper'

describe AngellistApi::Authentication do
  class BasicClass
    include AngellistApi::Authentication
  end
  
  class FullClass
    include AngellistApi::Authentication
    attr_accessor :access_token
  end

  describe "#authentication" do
    context "without auth variables defined" do
      it "should return a hash with nil values" do
        a = BasicClass.new
        a.send(:authentication).values.any?.should be_false
      end
    end
    
    context "with auth variables defined" do
      before(:each) do
        @a = FullClass.new
      end
      
      it "should return a hash with nil values if auth variables are not set" do
        @a.send(:authentication).values.all?.should be_false
      end

      it "should return a hash with nil values if auth variables are set" do
        @a.access_token = "token"
        @a.send(:authentication).values.all?.should be_true
      end
    end
  end
  
  describe "#authenticated?" do
    before(:each) do
      @a = FullClass.new
    end
        
    it "should return false if authentication has any nil values" do
      @a.expects(:authentication).returns({:access_token=>nil})
      @a.send(:authenticated?).should be_false
    end
    
    it "should return true if authentication has no nil values" do
      @a.expects(:authentication).returns({:access_token=>"1"})
      @a.send(:authenticated?).should be_true
    end
  end

end