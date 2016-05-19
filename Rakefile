require "bundler/gem_tasks"
require "rspec/core/rake_task"

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

RSpec::Core::RakeTask.new(:spec)

task :console do
  require 'irb'
  require 'irb/completion'
  require 'bootstrap_component'
  ARGV.clear
  IRB.start
end

task :default => :spec
