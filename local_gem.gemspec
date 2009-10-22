# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{local_gem}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabriel Horner"]
  s.date = %q{2009-10-22}
  s.description = %q{You have the beginnings of a ruby library and you want to access it quick. You don't want to bother making a gemspec for it and uninstalling/reinstalling its gem while you mess with it. Simply tell LocalGem what paths it should load for your local gem and they will be loaded. Note that it doesn't matter how gem-like your project is ie lib and bin directories etc. LocalGem only needs to know the full path to your gem/library.}
  s.email = %q{gabriel.horner@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/config_struct.rb",
    "lib/local_gem.rb",
    "lib/local_gem/override.rb",
    "test/local_gem_test.rb",
    "test/override_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://tagaholic.me/local_gem/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tagaholic}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Loads any gem/library simply given its path. Great for nascent gems and/or for trying the latest code on a gem.}
  s.test_files = [
    "test/local_gem_test.rb",
    "test/override_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
