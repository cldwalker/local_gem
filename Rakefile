require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
begin
  require 'rcov/rcovtask'

  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.rcov_opts = ["-T -x '/Library/Ruby/*'"]
    t.verbose = true
  end
rescue LoadError
  puts "Rcov not available. Install it for rcov-related tasks with: sudo gem install rcov"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "local_gem"
    s.summary = "Loads any gem/library simply given its path. Great for nascent gems and/or for trying the latest code on a gem."
    s.description = "You have the beginnings of a ruby library and you want to access it quick. You don't want to bother making a gemspec for it and uninstalling/reinstalling its gem while you mess with it. Simply tell LocalGem what paths it should load for your local gem and they will be loaded. Note that it doesn't matter how gem-like your project is ie lib and bin directories etc. LocalGem only needs to know the full path to your gem/library."
    s.email = "gabriel.horner@gmail.com"
    s.homepage = "http://tagaholic.me/local_gem/"
    s.authors = ["Gabriel Horner"]
    s.rubyforge_project = 'tagaholic'
    s.has_rdoc = true
    s.files = FileList["CHANGELOG.rdoc", "VERSION.yml","Rakefile", "README.rdoc", "LICENSE.txt", "{bin,lib,test}/**/*"]
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'test'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :test
