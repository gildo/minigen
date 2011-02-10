require 'fileutils'

LIBDIR = File.dirname(__FILE__)

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift(File.join('minigen'))
$LOAD_PATH.unshift(dir)

require "minigen/generator"

module Minigen

  VERSION = "0.0.2"

end
