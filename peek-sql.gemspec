Gem::Specification.new do |spec|
  spec.name          = 'peek-sql'
  spec.version       = '0.0.1'
  spec.authors       = ['Pieter van de Bruggen']
  spec.email         = ['pvande@gmail.com.com']
  spec.description   = "Peek into the SQL queries being run in your application.",
  spec.summary       = "Peek into the SQL queries being run in your application.",
  spec.homepage      = 'https://github.com/pvande/peek-sql'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'peek'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
