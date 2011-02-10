require File.expand_path("../lib/minigen", __FILE__)

Gem::Specification.new do |s|

  s.name              = 'minigen'
  s.version           = Minigen::VERSION

  s.summary     = "just another projects generator"
  s.description = "a project generator that creates a simple ruby library skel"

  s.authors  = ["Ermenegildo Fiorito"]
  s.homepage = 'http://github.com/fyskij/minigen#readme'

  s.require_paths = %w[lib]
  s.files = %w( README.md )
  s.files += Dir.glob("lib/**/*")
  s.files += Dir.glob("test/*")
  s.files += Dir.glob("bin/**/*")
  s.executables = %w( mgen )

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
