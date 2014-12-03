# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jr_paper_trail_yaml_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "jr_paper_trail_yaml_serializer"
  spec.version       = JrPaperTrailYamlSerializer::VERSION
  spec.authors       = ["Brad Bollenbach"]
  spec.email         = ["bradb@jobready.com.au"]
  spec.summary       = %q{A YAML serializer for paper_trail, that works with carrierwave-cascade}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/jobready/jr_paper_trail_yaml_serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'paperclip', '~> 3.5.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
