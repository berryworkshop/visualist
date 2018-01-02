<<<<<<< HEAD
# Rakefile

task default: :test

desc "Run all tests"
task(:test) do
  Dir['./test/**/test*.rb'].each do |f|
    load f
  end
end
=======
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
>>>>>>> redo
