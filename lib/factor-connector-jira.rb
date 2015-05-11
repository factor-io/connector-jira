require 'factor/connector/definition'
require 'factor/connector/runtime'
require 'jira'
require '../jira_creditentials'

class JiraConnectorDefinition < Factor::Connector::Definition
  id :jira

  resource :projects do

    # call 'jira::issues::list'
    action :list do |params|
      username = params.varify(:username,required:true,is_a:String)
      password = params.varify(:password,required:true,is_a:String)
      site     = params.varify(:site, required:true, is_a:String)

      info "Connecting to '#{site}' as '#{username}'"
      client   = JIRA::Client.new(username:username, password:password, auth_type: :basic, site:site)

      respond []
    end
  end
end
