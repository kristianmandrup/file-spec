# File spec

RSpec 2 matcher to specify expected file structures.

## Usage

See /spec folder for usage examples.

## TODO

Make more convenience methods:

* have_files file1, file2
* have_dirs dir1, dir2
* have_symlinks sym1, sym2

* have_symlink_file sym_file
* have_symlink_dir sym_dir
* have_symlink_files sym_file1, sym_file2
* have_symlink_dirs sym_dir1, sym_dir2

* have_file_structure yaml

Should test that the files and dirs match the tree structure of the yaml string (or file)

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
