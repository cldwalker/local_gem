# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{local_gem}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabriel Horner"]
  s.date = %q{2009-02-01}
  s.description = %q{Loads any gem/library simply given its path. Great for nascent gems and/or for trying the latest code on a gem.}
  s.email = %q{gabriel.horner@gmail.com}
  s.files = ["VERSION.yml", "Rakefile", "README.rdoc", "LICENSE.txt", "lib/config_struct.rb", "lib/local_gem", "lib/local_gem/override.rb", "lib/local_gem.rb", "test/local_gem_test.rb", "test/override_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/cldwalker/local_gem}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Loads any gem/library simply given its path. Great for nascent gems and/or for trying the latest code on a gem.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
