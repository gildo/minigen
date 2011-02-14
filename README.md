minigen
=======

> just another projects generator

installation
------------

    $: [sudo] gem install minigen

description
-----------

a project generator that creates a tree like this (eg.):

    .
    ├── project.gemspec
    ├── lib
    │   └── project.rb
    ├── README.md
    └── test
        ├── project_test.rb
        └── test_helper.rb

### PROJECT.gemspec

a simple gemspec that takes the variable "version" from the constant "VERSION" present in "lib/project.rb"

### lib/PROJECT.rb

contains something like:

    module YourProject
      VERSION = "0.0.0"
    end

### README.md

a simple, markdown formatted, readme that contains some essential points (see paragraph one of: [pengwynn's](http://twitter/pengwynn) [awesome post](http://thechangelog.com/post/3032074343/top-ten-reasons-why-i-wont-use-your-open-source-project))

### test/test_helper.rb

For now supports only two test suites:

* [Shoulda](https://github.com/thoughtbot/shoulda)

* the **supercool** [defunkt's](http://github.com/defunkt) [test/spec/mini](https://gist.github.com/307649)

### test/project_test.rb

a failing test


synopsis
--------

This command _generates_ a _new project_ using **shoulda** as test suite.

    $: mgen mycoolproject shoulda

    >:  - Generating your project: mycoolproject

If you want **test/spec/mini**:

    $: mgen mynewproject tsm

** enjoy! **

license
-------

This program is distributed under the [GNU Affero General Public License](http://www.gnu.org/licenses/agpl.html)

contribution and issues
-----------------------

Want to contribute?

[Fork][0] minigen

Have issues?

Create an [Issue][1]


author
------

Gildo Fiorito (fyskij@gmail.com)

[0]: http://help.github.com/forking/
[1]: http://github.com/fyskij/minigen/issues
