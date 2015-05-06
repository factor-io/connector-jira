require 'rspec'
require 'factor/connector/test'


require 'factor-connector-jira'

RSpec.configure do |c|
  c.include Factor::Connector::Test

  c.before :each do
    @runtime = Factor::Connector::Runtime.new(JiraConnectorDefinition)
  end

end