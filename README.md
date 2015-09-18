# .dotfiles
This is my dot files.

```bash
curl -L https://raw.githubusercontent.com/tacahilo/.dotfiles/master/install.sh | sh
```
setup
---

```
bundle install --path=.bundle/ -j4
bundle exec itamae local roles/osx.rb
bundle exec rake spec
```
