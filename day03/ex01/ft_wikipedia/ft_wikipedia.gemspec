
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ft_wikipedia/version"

Gem::Specification.new do |spec|
  spec.name          = "ft_wikipedia"
  spec.version       = FtWikipedia::VERSION
  spec.authors       = ["qweissna"]
  spec.email         = ["."]

  spec.summary       = "ft_wikipedia"
  spec.description   = "Search pages until Philosophy"
  spec.homepage      = "https://github.com/AoedeFeuer"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency 'colorize', '~> 0.7'
  spec.add_dependency 'nokogiri', '~> 1.10'
end
