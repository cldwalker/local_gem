require 'ostruct'

class ConfigStruct < OpenStruct
  # Converts the data within the given block to hash
  def self.block_to_hash(block=nil)
    config = self.new
    if block
      block.call(config)
      config.to_hash
    else
      {}
    end
  end

  def to_hash #:nodoc:
    @table
  end
end
