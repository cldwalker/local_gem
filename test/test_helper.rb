require 'rubygems' # needed for override tests
require 'bacon'
require 'mocha'
require 'mocha-on-bacon'
require 'local_gem'

class Bacon::Context
  def before_all; yield; end
end