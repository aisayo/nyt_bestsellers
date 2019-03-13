require_relative './config/environment'

def reload!
  load.all './lib'

require "bundler/gem_tasks"
task :default => :spec

task :console do
  Pry.start 
