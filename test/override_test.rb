require File.join(File.dirname(__FILE__), 'test_helper')

describe "Override" do
  before_all { require 'local_gem/override' }
  it "gem calls old_gem and load_local_gem" do
    LocalGem::Singleton.expects(:load_local_gem).once
    self.expects(:old_gem).once
    gem('blah')
  end

  it "require calls old_require and load_local_gem" do
    LocalGem::Singleton.expects(:load_local_gem).once
    self.expects(:old_require).once
    require('blah')
  end

  it "loading override should have included LocalGem in self" do
   self.instance_eval("class<<self; self; end").ancestors.should.include?(LocalGem)
  end
end
