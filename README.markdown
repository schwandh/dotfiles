# wmernagh does dotfiles

# ln -s <DEV_REPO> ~/Development

## dotfiles

This is based off of [@holman's](http://github.com/holman/) [dotfiles](http://github.com/holman/dotfiles)

Your dotfiles are how you personalize your system. These are mine. 

This is a mix of files for OS X & Linux, bash, Ruby, Rails, git, homebrew, TextMate, vim. If you match up along most of those lines, you may want to fork my dotfiles.

This setup avoids long alias files and everything strewn about (which is extremely common in other dotfiles projects, too). That lead [@holman's](http://github.com/holman/) to create his [dotfiles](http://github.com/holman/dotfiles) project which is much more topic-centric. [@holman's](http://github.com/holman/) split a lot of things up into the main areas he used (Ruby, git, system libraries, and so on), and structured the project accordingly.

If you're interested in the philosophy behind why projects like these are awesome, you might want to [read @holman's post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## install

- `git clone git://github.com/wmernagh/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`, which sets up a few paths that'll be different on your particular machine.

Also you should probably fork this repo and install your own version on your machine though. That way as you customize it for your liking you can keep track of it and make it easier to install onto numerous machines

## topical

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. Anything with an extension of `.bash` will get automatically included into your shell. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of what's inside is just aliases: `gs` for `git status`, `gl` for `git pull --rebase --prune`, for example. You can browse the `aliases.bash` files in each topic directory. There's also a collection of scripts in `bin` you can browse. A few notable ones:

###rails
- `s` pings your system for any running Rails apps, and `deathss` will then kill all of them indiscriminately. `ss` starts up a new Rails server on the next available port- if 3000 is taken, it'll spin up your server on 3001.

###system
- `c` is an autocomplete shortcut to your projects directory. For example, `c git` and then hitting tab will autocomplete to `github`, and then it simply changes to my `github` directory.
- `check [filename]` is a quick script that tells you whether a domain is available to register.
- `smartextract [filename]` will extract about a billion different compressed/uncompressed/whatever files.

##moar custom
There are a few things I use to make my life awesome. They're not a required dependency, but if you make it happen, THEY'LL MAKE **YOU** HAPPEN.

- If you want some more colors for things like `ls`, install grc: `brew install grc`.
- If you install the excellent [rvm](http://rvm.beginrescueend.com) to manage multiple rubies, your current branch will show up in the prompt. Bonus.

## thanks
This is based off of [@holman's](http://github.com/holman/) wonderful [dotfiles](http://github.com/holman/dotfiles) which are ZSH based. I have modified them to be BASH based.

[@holman's](http://github.com/holman/) forked [Ryan Bates](http://github.com/ryanb)' excellent [dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the weight of his changes and tweaks inspired him to finally roll his own. But Ryan's dotfiles were an easy way to get into bash customization, and then to jump ship to zsh a bit later. A decent amount of the code in these dotfiles stem or are inspired from Ryan's original project.
