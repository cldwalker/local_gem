module Kernel
  alias_method :old_require, :require
  alias_method :old_gem, :gem

  def gem(*args)
    load_local_gem(args[0]) || old_gem(*args)
  end

  def require(lib)
    load_local_gem(lib)
    old_require(lib)
  end
end

send :include, LocalGem
