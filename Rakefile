#!/usr/bin/env rake
$: << File.dirname(__FILE__)

require 'bundler'
require 'rake'
require 'rspec/core/rake_task'

task :default => [:spec]
task :test => [:spec]

desc "run spec tests"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
