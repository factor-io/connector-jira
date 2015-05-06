# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-jira'
  s.version       = '3.0.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Sylwia Bialczak', 'Maciej Skierkowski']
  s.email         = ['sylwia@argoncode.com', 'maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Jira Factor.io Connector'
  s.files         = ['lib/factor-connector-jira.rb']
  
  s.require_paths = ['lib']

  s.add_runtime_dependency 'jira-ruby', '~> 0.1.14'

  s.add_development_dependency 'coveralls', '~> 0.8.1'
  s.add_development_dependency 'rspec', '~> 3.2.0'
  s.add_development_dependency 'rake', '~> 10.4.2'
end