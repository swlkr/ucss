lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ucss'

Gem::Specification.new do |spec|
  spec.name          = 'ucss'
  spec.version       = '1.2.0'
  spec.authors       = ['Sean Walker']
  spec.email         = ['']

  spec.summary       = %q{Tailwind jit inspired utility css generator}
  spec.description   = %q{This gem reads files in your view folders for tailwind-like classes and writes the resulting utility css classes to a css file.
}
  spec.homepage      = 'https://github.com/swlkr/ucss'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/swlkr/ucss'
    spec.metadata['changelog_uri'] = 'https://github.com/swlkr/ucss/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2.10'
  spec.add_development_dependency 'rake', '~> 13.0'
end
