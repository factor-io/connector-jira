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

  resource :jira_main do
    action :initialize do |params|
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
      info "You have #{projects_list.length} projects"
      projects_list
    end
  end

  resource :issues do
    action :add do |params| # fields must be in params,
# TODO: which fields are required and which are optional, setup hash to reflect that
# TODO: find out how to add project_id to logs, missing method?
      summary = params[:summary]
      project_id = params[:project_id]
      issue_type = params[:issue_type]
      
      issue_fields = { "fields" => { "summary" => summary,
        "project" => { "id" => project_id},
        "issuetype" => {"id"=> issue_type}
        }
      }

      client = init_jira(params)

      new_issue = client.Issue.build
      new_issue.save(issue_fields)
      info "Issue number #{new_issue.id} was created. Summary: #{new_issue.summary}"

      new_issue
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
