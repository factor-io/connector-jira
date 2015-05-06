require 'rspec'
require 'factor/connector/test'
require 'coveralls'

Coveralls.wear!

require 'factor-connector-jira'

RSpec.configure do |c|
  c.include Factor::Connector::Test

  c.before :each do
    @username = ENV['JIRA_USERNAME']
    @password = ENV['JIRA_PASSWORD']
    @site     = ENV['JIRA_SITE']
    @runtime = Factor::Connector::Runtime.new(JiraConnectorDefinition)
  end

end