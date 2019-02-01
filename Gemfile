source 'https://rubygems.org'
gemspec

git 'https://github.com/refinery/refinerycms.git', :branch => 'master' do
  gem 'refinerycms'

  group :development, :test do
    gem 'refinerycms-testing'
  end
end

group :development, :test do
  gem 'listen'
  gem 'shoulda-matchers', '~> 3.1'
end