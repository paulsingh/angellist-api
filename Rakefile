begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'yard'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :spec

namespace :spec do
  [:integration, :unit].each do |type|
    desc "Run the code examples in spec/#{type}"
    RSpec::Core::RakeTask.new(type) do |t|
      t.pattern = "./spec/#{type}/**/*_spec.rb"
    end
  end
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
end

