このコミットは、以下理由により、jbuilder.gemspecやgemfilesディレクトリ配下のrails_6_0、rails_6_1、rails_7_0のgemfilesにbase64のgemを追加しています。


Add base64 to gemspec and gemfile

This commit adds base64 gem to rails_6_0, rails_6_1 and rails_7_0 gemfiles in gemfiles directory and jbuilder.gemspec for the following reasons.

- Starting from Ruby 3.3, using base64 raises the following warning.

> warning: base64 was loaded from the standard library, but will no longer be part of the default gems since Ruby 3.4.0. Add base64 to your Gemfile or gemspec. Also contact author of activesupport-6.0.6.1 to add base64 into its gemspec.

- The reason for not adding gems to rails7_1.gemfiles and rails_head.gemfiles is that the base64 gem has been added to activesupport.gemspec since ActiveSupport 7.1 with add_dependency.

However, we do not add base64 gem to jbuilder.gemspec for the following reason.

- jbuilder supports Ruby 2.2, but initial version (v0.1.0) of base64 gem supports Ruby 2.3 and above. Therefore if we add base64 to jbuilder.gemspec, it fails while running the `bundle install` command.


Refer to
https://bugs.ruby-lang.org/issues/20187
https://github.com/ruby/ruby/pull/9550
https://github.com/rails/rails/blob/v7.1.0/activesupport/activesupport.gemspec




> Jbuilder does not depend on the base64 gem directly.

Yes, that’s true.
However, jbuilder depends on activesupport which depends on base64 gem.
In the 7.0.8.3 version of activesupport and below, base64 gem does not be added to the activesupport.gemspec, but MessageVerifier class in activesupport calls `require base64`.
Refer: https://github.com/rails/rails/blob/v7.0.8.3/activesupport/lib/active_support/message_verifier.rb

Therefore, when jbuilder load the MessageVerifier class, Ruby 3.3 raise the following warning.

```sh
/home/runner/work/jbuilder/jbuilder/vendor/bundle/ruby/3.3.0/gems/activesupport-7.0.8.3/lib/active_support/message_verifier.rb:4: warning: base64 was loaded from the standard library, but will no longer be part of the default gems since Ruby 3.4.0. Add base64 to your Gemfile or gemspec. Also contact author of activesupport-7.0.8.3 to add base64 into its gemspec.
```
Refer:
- See Ruby test step in GitHub Actions log: https://github.com/rails/jbuilder/actions/runs/9135217481/job/25122206047

The only activesupport that has base64 added to gemspec is the 7.1.0 version or higher.
Refer: https://github.com/rails/rails/pull/48907

So if jbuilder is using an activesupport with less than 7.1.0 version, we think it is necessary to add the base64 gem to the gemfile.