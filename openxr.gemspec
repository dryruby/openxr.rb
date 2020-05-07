Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'openxr'
  gem.homepage           = 'https://github.com/dryruby/openxr.rb'
  gem.license            = "Unlicense"
  gem.summary            = "OpenXR bindings for Ruby."
  gem.description        = <<~EOS
    OpenXR.rb implements Ruby bindings for OpenXR 1.0, the open standard and
    cross-platform API for virtual reality (VR) and augmented reality (AR)
    hardware.
  EOS

  gem.author             = "Arto Bendiken"
  gem.email              = 'arto@bendiken.net'

  gem.metadata = {
    'bug_tracker_uri'   => 'https://github.com/dryruby/openxr.rb/issues',
    'changelog_uri'     => 'https://github.com/dryruby/openxr.rb/blob/master/CHANGES.md',
    'documentation_uri' => 'https://www.rubydoc.info/github/dryruby/openxr.rb/master',
    'homepage_uri'      => gem.homepage,
    'source_code_uri'   => 'https://github.com/dryruby/openxr.rb',
  }

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS CHANGES.md CREDITS.md README.md UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w()
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()

  gem.required_ruby_version      = '>= 2.7.0'
  gem.required_rubygems_version  = '>= 3.1.2' # Ruby 2.7.0
  gem.requirements               = []
  gem.add_development_dependency 'ffidb',     '~> 0.6'
  gem.add_development_dependency 'rake',      '>= 13'
  gem.add_development_dependency 'rspec',     '>= 3.9'
  gem.add_development_dependency 'yard' ,     '>= 0.9'
  gem.add_runtime_dependency     'ffi',       '~> 1.12'
  gem.post_install_message       = nil
end
