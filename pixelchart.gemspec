# frozen_string_literal: true

require_relative 'lib/pixelchart/version'

Gem::Specification.new do |s|
  s.name          = 'pixelchart'
  s.version       = Version::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'Create a binary pixel map'
  s.description   = s.summary
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@engineer.com'
  s.homepage      = 'https://noraj.github.io/PixelChart/'
  s.license       = 'MIT'

  s.files         = Dir['bin/*'] + Dir['lib/**/*.rb'] + ['LICENSE.txt']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'              => 'yard',
    'bug_tracker_uri'       => 'https://github.com/noraj/PixelChart/issues',
    'changelog_uri'         => 'https://github.com/noraj/PixelChart/blob/master/pages/CHANGELOG.md',
    'documentation_uri'     => 'https://noraj.github.io/PixelChart/yard/',
    'homepage_uri'          => 'https://noraj.github.io/PixelChart/',
    'source_code_uri'       => 'https://github.com/noraj/PixelChart',
    'funding_uri'           => 'https://github.com/sponsors/noraj',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.1.0', '< 4.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.3') # for colorized output
  s.add_runtime_dependency('rmagick', '~> 6.0') # image processing (backend 1)
  s.add_runtime_dependency('ruby-vips', '~> 2.2') # image processing (backend 2)
end
