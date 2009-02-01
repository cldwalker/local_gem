require File.join(File.dirname(__FILE__), 'test_helper')

class LocalGem::OverrideTest < Test::Unit::TestCase
  before(:all) { require 'local_gem/override' }
  test "gem calls old_gem and load_local_gem" do
    LocalGem::Singleton.expects(:load_local_gem).once
    self.expects(:old_gem).once
    gem('blah')
  end

  test "require calls old_require and load_local_gem" do
    LocalGem::Singleton.expects(:load_local_gem).once
    self.expects(:old_require).once
    require('blah')
  end

  test "loading override should have included LocalGem in self" do
   assert self.instance_eval("class<<self; self; end").ancestors.include?(LocalGem)
  end
end
