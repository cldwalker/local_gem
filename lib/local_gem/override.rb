module Kernel
  alias_method :old_require, :require
  alias_method :old_gem, :gem

  def gem(*args)
    LocalGem::Singleton.load_local_gem(args[0]) || old_gem(*args)
  end

  def require(lib)
    LocalGem::Singleton.load_local_gem(lib)
    old_require(lib)
  end

  private :old_require, :old_gem
end

self.send :include, LocalGem
