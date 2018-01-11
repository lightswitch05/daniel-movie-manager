task :validate do
  require 'reek/rake/task'

  Reek::Rake::Task.new do |t|
    t.source_files = "app"
    t.verbose = false
    t.fail_on_error = true
    t.config_file   = 'config/config.reek'
  end

  puts '----------------Running reek to find smelly code--------------------'
  Rake::Task['reek'].invoke

  puts '-------------Running rubocop to find poor practices-----------------'
  system "bundle exec rubocop --rails app"
end
