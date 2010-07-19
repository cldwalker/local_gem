# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/local_gem/version"

Gem::Specification.new do |s|
  s.name        = "local_gem"
  s.version     = LocalGem::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://tagaholic.me/local_gem/"
  s.summary = "Loads any gem/library simply given its path. Great for nascent gems and/or for trying the latest code on a gem."
  s.description = "You have the beginnings of a ruby library and you want to access it quick. You don't want to bother making a gemspec for it and uninstalling/reinstalling its gem while you mess with it. Simply tell LocalGem what paths it should load for your local gem and they will be loaded. Note that it doesn't matter how gem-like your project is ie lib and bin directories etc. LocalGem only needs to know the full path to your gem/library."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.add_development_dependency 'bacon', '>= 1.1.0'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'mocha-on-bacon'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
