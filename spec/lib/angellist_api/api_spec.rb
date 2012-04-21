require 'spec_helper'

describe AngellistApi::API do

  describe "#initialize" do
    context "without passing new options" do
      it "uses the default options" do
        api = AngellistApi::API.new
        AngellistApi::Configuration::VALID_OPTIONS_KEYS.each do |valid_key|
          api.send(valid_key).should == AngellistApi.options[valid_key]
        end
      end
    end

    context "while passing custom options" do
      it "uses the new options" do
        key_to_overwrite = AngellistApi.options.keys.first
        overwrite_value  = "NEW VALUE!!"

        api = AngellistApi::API.new(key_to_overwrite => overwrite_value)
        AngellistApi::Configuration::VALID_OPTIONS_KEYS.each do |valid_key|
          expected_value = valid_key == key_to_overwrite ? overwrite_value : AngellistApi.options[valid_key]
          api.send(valid_key).should == expected_value
        end
      end
    end
  end

  describe "configuration" do
    let(:api) { AngellistApi::API.new }

    AngellistApi::Configuration::VALID_OPTIONS_KEYS.each do |config_key|
      it "allows the value of #{config_key} to be set" do
        expect { api.send("#{config_key}=", "SOME NEW VALUE") }.to_not raise_error
        api.send(config_key).should == "SOME NEW VALUE"
      end
    end
  end
end

