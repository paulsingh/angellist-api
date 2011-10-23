require 'spec_helper'

describe AngellistApi::Error do
  
  describe "#initialize" do
    context "message parameter" do
      it "should not raise an error if it is nil" do
        lambda { AngellistApi::Error.new(nil, :header => "data") }.should_not raise_error
      end
      
      it "should build an error with the given message" do
        error = AngellistApi::Error.new("bad data", :header => 'data')
        error.message.should == "bad data"
      end
    end
    
    context "http_headers parameter" do
      it "should raise an exception if no http headers are passed" do
        lambda { AngellistApi::Error.new("some message", nil) }.should raise_error(ArgumentError, "odd number of arguments for Hash")
      end
      
      it "should raise an exception if the params cant be converted to a hash" do
        lambda { AngellistApi::Error.new("some message", "header") }.should raise_error(ArgumentError, "odd number of arguments for Hash")
      end
      
      it "should be set with the params" do
        error = AngellistApi::Error.new("some message", :some => "value")
        error.http_headers.should == { :some => "value" }
      end
    end
  end
  
  describe "#ratelimit_reset" do
    it "should return the time set as x-rate-limit-reset if it's set" do
      time1 = Time.now.to_i
      time2 = time1 + 3600
      error = AngellistApi::Error.new("message", {'x-ratelimit-reset' => time1, 'X-RateLimit-Reset' => time2})
      error.ratelimit_reset.should == Time.at(time1)
    end
    
    it "should return the time set as X-RateLimit-Reset if x-rate-limit-reset is empty" do
      time = Time.now.to_i
      error = AngellistApi::Error.new("message", {'x-ratelimit-reset' => nil, 'X-RateLimit-Reset' => time})
      error.ratelimit_reset.should == Time.at(time)
    end
    
    it "should return 0 if both X-RateLimit-Reset or x-rate-limit-reset are not set" do
      error = AngellistApi::Error.new("message", {})
      error.ratelimit_reset.should == Time.at(0)
    end
  end

  describe "#ratelimit_limit" do
    it "should return the number set as x-rate-limit-limit if it's set" do
      error = AngellistApi::Error.new("message", {'x-ratelimit-limit' => 500, 'X-RateLimit-Limit' => 400})
      error.ratelimit_limit.should == 500
    end
    
    it "should return the number set as X-RateLimit-Limit if x-rate-limit-limit is empty" do
      error = AngellistApi::Error.new("message", {'x-ratelimit-limit' => nil, 'X-RateLimit-Limit' => 600})
      error.ratelimit_limit.should == 600
    end
    
    it "should return 0 if both X-RateLimit-Limit or x-rate-limit-limit are not set" do
      error = AngellistApi::Error.new("message", {})
      error.ratelimit_limit.should == 0
    end
  end

  describe "#ratelimit_remaining" do
    it "should return the number set as x-rate-limit-remaining if it's set" do
      error = AngellistApi::Error.new("message", {'x-ratelimit-remaining' => 22, 'X-RateLimit-Remaining' => 23})
      error.ratelimit_remaining.should == 22
    end
    
    it "should return the number set as X-RateLimit-Remaining if x-rate-limit-remaining is empty" do
      error = AngellistApi::Error.new("message", {'x-ratelimit-remaining' => nil, 'X-RateLimit-Remaining' => 32})
      error.ratelimit_remaining.should == 32
    end
    
    it "should return 0 if both X-RateLimit-Remaining or x-rate-limit-remaining are not set" do
      error = AngellistApi::Error.new("message", {})
      error.ratelimit_remaining.should == 0
    end
  end

  describe "#retry_after" do
    context "a normal Error object" do    
      before(:each) do
        @error = AngellistApi::Error.new("message", {})
      end
    
      it "should give you the time in seconds when it is acceptable to make another call" do
        Timecop.freeze(Time.now) do
          @error.expects(:ratelimit_reset).returns(Time.now + 3600)
          @error.retry_after.should == 3600
        end
      end
    
      it "should return 0 if the ratelimit_reset time is in the past" do
        Timecop.freeze(Time.now) do
          @error.expects(:ratelimit_reset).returns(Time.now - 3600)
          @error.retry_after.should == 0
        end
      end
    end
    
    context "an EnhanceYourCalm Error object" do
      it "should return the number of seconds set as retry-after if it's set" do
        error = AngellistApi::EnhanceYourCalm.new("message", {'retry-after' => 12, 'Retry-After' => 13})
        error.retry_after.should == 12
      end

      it "should return the number set as Retry-After if retry-after is empty" do
        error = AngellistApi::EnhanceYourCalm.new("message", {'retry-after' => nil, 'Retry-After' => 16})
        error.retry_after.should == 16
      end

      it "should return 0 if both Retry-After or retry-after are not set" do
        error = AngellistApi::EnhanceYourCalm.new("message", {})
        error.retry_after.should == 0
      end
    end
  end
  
end