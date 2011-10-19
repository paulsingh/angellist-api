source "http://rubygems.org"

# Declare your gem's dependencies in angellist_api.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem 'rake'

platforms :mri_18 do
  gem 'ruby-debug'
end

platforms :mri_19 do
  gem 'ruby-debug19', :require => 'ruby-debug' if RUBY_VERSION < '1.9.3'
end

