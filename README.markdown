# File spec

RSpec 2 matcher to specify expected file structures. 

This gem is used extensively by some of my Rails 3 assistance gems such as *rails3_assist*, *rails3_artifactor* and *rails-app-spec* which all assist you in 
operating on various kinds of Rails 3 artifacts.

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
    dir.should have_symlink :xyz
    dir.should have_symlink_files 'blip.rb', 'blap.rb', 'logfile.log'
    dir.should have_symlink_dir 'my-secret-dir'
  end
end
</pre>  

See /spec folder for more usage examples.

## TODO - advanced

* use Dir.tmpdir
* have_file_structure yaml

Should test that the files and dirs match the tree structure as indicated by the yaml string (or file).
This is very convenient for more complex file structure specs!
<pre>
mydir:
  - file1.txt
  - file2.txt
  subdir1: [abc.rb, def.rb]
  subdir2: [x.txt, logfile.log] 
</pre>

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
