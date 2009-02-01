require File.join(File.dirname(__FILE__), 'test_helper')

class LocalGem::Test < Test::Unit::TestCase
  before(:each) {
    LocalGem::Singleton.config = { :gems=>{
    'gem1'=>'path1', 'gem2'=>['path2','path3']}
    }
  }

  test "local_gem adds gem's one path to $:" do
    full_gem_path = File.expand_path(LocalGem::Singleton.config[:gems]['gem1'])
    assert !$:.include?(full_gem_path)
    LocalGem.local_gem('gem1')
    assert $:.include?(full_gem_path)
  end

  test "local_gem adds gem's multiple paths to $:" do
    full_gem_paths = LocalGem::Singleton.config[:gems]['gem2'].map {|e| File.expand_path(e) }
    assert ($: & full_gem_paths).empty?
    LocalGem.local_gem('gem2')
    assert !($: & full_gem_paths).empty?
  end

  test "local_gem defaults to gem if no local gem found" do
    LocalGem::Singleton.expects(:gem).once
    LocalGem.local_gem('invalid')
  end

  test "local_gem calls load_local_gem for a valid gem" do
    LocalGem::Singleton.expects(:load_local_gem).once.returns(true)
    LocalGem.local_gem('blah')
  end

  test "local_require calls load_local_gem and require" do
    LocalGem::Singleton.expects(:require).once
    LocalGem::Singleton.expects(:load_local_gem).once
    LocalGem.local_require('blah')
  end

  test "setup_config with hash initializes config" do
    config = {:gems=>{'blah_gem'=>'blah_path'}}
    LocalGem::Singleton.setup_config(config)
    assert_equal config, LocalGem::Singleton.config
  end

  test "setup_config with block initializes config" do
    config = {:gems=>{'blah_gem'=>'blah_path'}}
    LocalGem::Singleton.setup_config do |c|
      c.gems = config[:gems]
    end
    assert_equal config, LocalGem::Singleton.config
  end

  test "read_config uses existing config_file" do
    LocalGem::Singleton.config_file = 'blah'
    File.expects(:new)
    YAML::expects(:load)
    LocalGem::Singleton.read_config
    assert_equal 'blah', LocalGem::Singleton.config_file
  end

  test "read_config uses config_file it detects" do
    LocalGem::Singleton.config_file = nil
    File.expects(:new)
    YAML::expects(:load)
    File.expects(:exists?).times(2).returns(false, true)
    LocalGem::Singleton.read_config
    assert 'local_gem.yml', File.basename(LocalGem::Singleton.config_file)
  end
end
