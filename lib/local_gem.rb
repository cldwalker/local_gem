$:.unshift(File.dirname(__FILE__)) unless 
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
require 'config_struct'

module LocalGem
  extend self
  def local_require(path)
    Singleton.local_require(path)
  end

  def local_gem(*args)
    Singleton.local_gem(*args)
  end

  def setup_config(config, &block)
    Singleton.setup_config(config, &block)
  end

  module Singleton
    extend self
    attr_accessor :config, :config_file

    def config
      @config ||= read_config
    end

    def read_config
      @config_file ||= ['local_gem.yml', File.join("~", ".local_gem.yml")].detect {|e| File.exists?(File.expand_path(e)) }
      @config_file ? YAML::load(File.new(File.expand_path(@config_file))) : {:gems=>{}}
    end

    def setup_config(config=nil, &block)
      @config = config || ConfigStruct.block_to_hash(block)
    end

    def local_gem(*args)
      load_local_gem(args[0]) || gem(*args)
    end

    def local_require(lib)
      load_local_gem(lib)
      require(lib)
    end

    def load_local_gem(library)
      if path = config[:gems][library]
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
end
