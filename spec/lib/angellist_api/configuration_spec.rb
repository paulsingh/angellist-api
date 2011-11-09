require 'spec_helper'

describe AngellistApi::Configuration do
  class ExtendedClass; extend  AngellistApi::Configuration; end
  class IncludedClass; include AngellistApi::Configuration; end
  
  describe "#extended" do
    it "should have all configuration variables set to the default values by default" do
      AngellistApi::Configuration::VALID_OPTIONS_KEYS.each do |key|
        ExtendedClass.send(key).should == AngellistApi::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end
  
  describe "#configure" do
    it "should allow configuration variables to be set in a block" do
      object = IncludedClass.new
      object.configure do |o|
        o.access_token = "my oauth token"
      end
      object.access_token.should == "my oauth token"
    end
  end
  
  describe "#options" do
    it "should return a hash of all configuration options" do
      object = IncludedClass.new
      config = { :access_token => "123-token" }
      config.each { |k,v| object.send("#{k.to_s}=", v) }
      config.each { |k,v| object.options[k].should == v }
    end
  end
  
  describe "#reset" do
    it "should set all config variables to the defaults" do
      object = IncludedClass.new
      AngellistApi::Configuration::VALID_OPTIONS_KEYS.each_with_index do |key, i|
        object.send("#{key}=", i)
        object.send(key).should == i
      end
      
      object.reset
      
      AngellistApi::Configuration::VALID_OPTIONS_KEYS.each_with_index do |key, i|
        object.send(key).should == AngellistApi::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end
end