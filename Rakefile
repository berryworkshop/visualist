# Rakefile

task default: :test

desc "Run all tests"
task(:test) do
  Dir['./test/**/test*.rb'].each do |f|
    load f
  end
end
