# Guard is not a hard development dependency -- you may add it to Gemfile.local
# if you wish to use it.
#
# More info at https://github.com/guard/guard#readme

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/unit/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/angellist_api/client/(.+)\.rb$}) { |m| "spec/integration/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

