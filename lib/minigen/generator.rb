module Minigen

  # Various methods to create the project skel
  class Generator

    # Public: Initialize a new Project
    def initialize name
      @name = name.downcase

      # Checks if a folder exists with the name @name
      # if false, exits with a message
      abort "A folder with that name already exists" if File.directory? @name

      # Runs the method that copies the template
      copy!

    end

    # Private: Copies the default template to @name dir
    def copy!
      puts " - \033[32mCopying\033[0m the default template to #{@name}"
      Dir.mkdir @name
      FileUtils.cp_r( Dir.glob(File.join(LIBDIR, 'template/*')), @name )
      Dir.chdir @name
      Dir.glob("**/*.{rb,md,gemspec}").each {|f| ore f, "project", @name}
      Dir.glob("**/*.{rb,md,gemspec}").each {|f| ore f, "Project", @name.capitalize}
      File.rename "test/project_test.rb", "test/#{@name}_test.rb"
      File.rename "lib/project.rb", "lib/#{@name}.rb"
      File.rename "project.gemspec", "#{@name}.gemspec"
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
      o = File.read(file).gsub! /#{old}/, new
      n = File.new(file, "w+")
      n.puts(o)
      return true
    end



    private :copy!, :ore

  end #Generator

end #Minigen