require 'factor/connector/definition'
require 'factor/connector/runtime'
require 'jira'
require 'pp'

class JiraConnectorDefinition < Factor::Connector::Definition
  id :jira

  def init_jira(params)
    connection_settings = {
      :username => params[:username],
      :password => params[:password],
      :site     => params[:site],

      :context_path => '',
      :auth_type => :basic
    }

    client = JIRA::Client.new connection_settings
    client
  end

  resource :jira_all do
    action :connect do |params| # just for testing for now
      client = init_jira(params)
      info "Client created at #{client.request_client.options[:site]} for #{client.request_client.options[:username]}"
      client
    end
  end

  resource :projects do
    action :list do |params|
      client = init_jira(params)
      projects = client.Project.all
      projects_list = []
      projects.each do |project|
        projects_list << project.key
      end

      projects_list
    end
  end

  resource :issues do
    action :add do |params|

    issue_fields = { "fields" => { "summary" => "This is rspec",
      "project" => { "id" => "10001"},
      "issuetype" => {"id"=>"3"}
      }
    }

    client = init_jira(params)

    create_new_issue = client.Issue.build
    create_new_issue.save(issue_fields)
    # what to return ?
    end
  end

  resource :test_definitions do
    action :test_info do
      info "This is info message added to logs"
    end

    action :test_warn do
      warn "This is warn message added to logs"
    end

    action :test_error do
      error "This is error message added to logs"
    end
  end

end
