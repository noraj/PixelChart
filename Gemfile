# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :runtime, :cli do
  gem 'docopt', '~> 0.6' # for argument parsing
  gem 'paint', '~> 2.2' # for colorized ouput
  gem 'rmagick', '~> 4.2' # image processing (backend 1)
  gem 'ruby-vips', '~> 2.0' # image processing (backend 2)
end

group :development, :install do
  gem 'bundler', '~> 2.1'
end

group :development, :test do
  gem 'minitest', '~> 5.15'
  gem 'rake', '~> 13.0'
end

group :development, :lint do
  gem 'rubocop', '~> 1.28'
end

group :development, :docs do
  gem 'commonmarker', '~> 0.23' # for markdown support in YARD
  gem 'yard', ['>= 0.9.27', '< 0.10']
end
