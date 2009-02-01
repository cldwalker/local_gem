$:.unshift(File.dirname(__FILE__)) unless 
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module LocalGem
  extend self
  #attr_accessor :config_file

  def local_config
    @local_config ||= read_config
  end

  def read_config(file=nil)
    @config_file = file || @config_file || (File.exists?('local_gem.yml') ? 'local_gem.yml' : File.expand_path(File.join("~",".local_gem.yml")))
    hash = YAML::load(File.new(@config_file))
  end

  def local_gem(*args)
    load_local_gem(args[0]) || gem(*args)
  end

  def local_require(lib)
    load_local_gem(lib)
    require(lib)
  end

  def load_local_gem(library)
    if path = local_config[library]
      path = [path] unless path.is_a?(Array)
      path.map {|e| File.expand_path(e) }.each do |f|
        $:.unshift(f) unless $:.include?(f)
      end
      true
    else
      false
    end
  end
end
