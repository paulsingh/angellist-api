source "http://rubygems.org"
gemspec

gem 'rake'

group :development do
  platforms :mri_18 do
    gem 'ruby-debug'
  end

  platforms :mri_19 do
    gem 'ruby-debug19', :require => 'ruby-debug' if RUBY_VERSION < '1.9.3'
  end
end

# Create a Gemfile.local if you would like to use additional development tools
# like Guard which substantially bloat the project's development deps otherwise.
local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(local_gemfile)
end

