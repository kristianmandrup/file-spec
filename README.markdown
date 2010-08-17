# File spec

RSpec 2 matcher to specify expected file structures.

## Usage

The following demonstrates File expectation nesting to test a File hierarchy structure!
Each block is evaluated in a new Dir context, using a Dir#chdir block.

Example: Nested file structure specs
<pre>
  Dir.chdir(my_path)
  Dir.pwd.should have_file 'hello.txt' do |dir|
    dir.should have_files 'abc.rb', 'def.rb'
    dir.should have_dir :test do |test_dir|
      test_dir.should have_dirs :test_abc, :test_def
    end
  end
end
</pre>  

See /spec folder for more usage examples.

## TODO

Currently these do not check file type of target but are just alias of generic have_symlink.
This must be fixed!

* have_symlink_file sym_file
* have_symlink_dir sym_dir

* have_symlink_files sym_file1, sym_file2
* have_symlink_dirs sym_dir1, sym_dir2

## TODO - advanced

* have_file_structure yaml

Should test that the files and dirs match the tree structure of the yaml string (or file).
This is very convenient for more complex file structure specs!

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
