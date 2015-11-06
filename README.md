# Hypothesis

This is my go at the hypothes.is code test described in `TASK.md`

## Usage

This solution is packaged as a ruby gem, and contains `.ruby-version` and `.ruby-gemset`
files to use with `rvm` (and possibly other ruby version managers).

In order to run this solution, the easiest way is to run `bundle install` followed
by `rake install`. This will build the gem and install it locally. It can then be
explored in a REPL by just requiring it:

```
irb> require 'hypothesis'
```

The file `run.rb` shows an example of how to use the interface for this solution.
