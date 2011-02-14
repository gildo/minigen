module Minigen

  # Really needed
  LIBDIR = File.dirname(__FILE__)

  # Various methods to create the project skel
  class Generator

    # Public: Initialize a new Project
    def initialize options = {}
      @options = options
      @name = @options[:name].downcase

      # The test suite, abort if empty
      # Note: this is stupid
      if not @options[:test].nil?
        @test = @options[:test]
      else
        abort "You must specify a test suite"
      end

      # Checks if a folder exists with the name @name
      # if false, exits with a message
      abort "A folder with that name already exists" if File.directory? @name

      puts " - \033[32mGenerating\033[0m your project: #{@name}"

      # Runs the method that copies the template
      copy!

    end

    # Private: Copies the default template to @name dir,
    # the chosen test suite, and runs gsub'n'rename
    #
    # Returns nothing
    def copy!
      # Create the project diretory
      Dir.mkdir @name

      # Copies the base template files (e.g. readme, gemspec, etc)
      FileUtils.cp_r(Dir.glob(File.join(LIBDIR, "templates/base/*")), @name)

      # Copies the test suite ( see @options[:test] )
      FileUtils.cp_r(Dir.glob(File.join(LIBDIR, "templates/#{@test}/*")), "#{@name}/test/")

      gnr!
    end

    # Private: gsub'n'rename
    #   Joins the new project directory,
    #   gsubs the content of all files with the new project name
    #   'nd renames all
    #
    # Returns nothing
    def gnr!
      Dir.chdir @name
      Dir.glob("**/*.{rb,md,gemspec}").each {|f| ore f, "project", @name}
      Dir.glob("**/*.{rb,md,gemspec}").each {|f| ore f, "Project", @name.capitalize}
      File.rename "test/test_project.rb", "test/test_#{@name}.rb"
      File.rename "lib/project.rb", "lib/#{@name}.rb"
      File.rename "project.gemspec", "#{@name}.gemspec"
      puts " - done!"
    end

    # Private: Opens, Reads and Edits a file
    #
    # file  - The file to edit
    # old   - The term to be replaced
    # new   - The new term
    #
    # Examples
    #
    #   ore('README.md', 'Minigen', 'Rubygems')
    #   # => True
    #
    # Returns True if everything went well :D
    def ore file, old, new
      o = File.read(file)
      o.gsub! /#{old}/, new
      n = File.new(file, "w+")
      n.puts(o)
      n.close
      return true
    end

    private :copy!, :gnr!, :ore

  end #Generator

end #Minigen

