source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails',                   '~> 5.2.1'
gem 'pg',                      '>= 0.18', '< 2.0'
gem 'puma',                    '~> 3.11'
gem 'sass-rails',              '~> 5.0'
gem 'uglifier',                '>= 1.3.0'
gem 'coffee-rails',            '~> 4.2'
gem 'turbolinks',              '~> 5'
gem 'jbuilder',                '~> 2.5'
gem 'bootsnap',                '>= 1.1.0', require: false
gem 'devise',                  '~> 4.5'
gem 'administrate',            '~> 0.11.0'
gem 'administrate-field-enum', '~> 0.0.7'

# Bootstrap.
gem 'bootstrap',               '~> 4.1', '>= 4.1.3'
gem 'jquery-rails',            '~> 4.3', '>= 4.3.3'

# Growl notifications.
gem 'gritter',                 '~> 1.2'

group :development, :test do
  gem 'awesome_print',         '~> 1.8'
  gem 'factory_bot_rails',     '~> 4.11', '>= 4.11.1'
  gem 'pry-byebug',            '~> 3.6'
  gem 'pry-rails',             '~> 0.3.6'
  gem 'rubocop-rails_config',  '~> 0.2.5'
end

group :development do
  gem 'guard',                      '~> 2.14',  '>= 2.14.2'
  gem 'guard-livereload',           '~> 2.5',   '>= 2.5.2', require: false
  gem 'guard-rails_best_practices',
    github: 'logankoester/guard-rails_best_practices', require: false
  gem 'guard-rspec',                '~> 4.7',   '>= 4.7.3', require: false
  gem 'listen',                     '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',      '~> 2.0.0'
  gem 'web-console',                '>= 3.3.0'
end

group :test do
  gem 'capybara',              '~> 3.10'
  gem 'database_cleaner',      '~> 1.7'
  gem 'launchy',               '~> 2.4', '>= 2.4.3'
  gem 'rspec-rails',           '~> 3.8',  '>= 3.8.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
