# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :default do
  # http://stackoverflow.com/a/6976052
  FileList["./spec/**/*_spec.rb"].each { |file| ruby file }
end
