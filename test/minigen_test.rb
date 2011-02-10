require File.expand_path(File.dirname(__FILE__) + '/test_helper')

context "Minigen" do

  context "generator" do
    setup do
      @project = "simplegem"
      Minigen::Generator.new(@project)
    end

    test "dir exists" do
      assert File.directory? @project
    end

    test "files exists" do
      Dir.chdir @project
      assert File.exist? "README.md"
      assert File.exist? "test/#{@project}_test.rb"
      assert File.exist? "test/test_helper.rb"
      assert File.exist? "#{@project}.gemspec"
      assert File.exist? "lib/#{@project}.rb"
    end

    test "correct names in files" do
      Dir.chdir("#{@project}")
      assert ref "#{@project}.gemspec" @project.to_s
    end

end
