require 'factor/connector/definition'
require 'factor/connector/runtime'
require 'jira'
require 'pp'

class JiraConnectorDefinition < Factor::Connector::Definition
  id :jira

  def init_jira(params)
    connection_settings = {
      :username => ENV['JIRA_USERNAME'],
      :password => ENV['JIRA_PASSWORD'],
      :site     => ENV['JIRA_SITE'],

      :context_path => '',
      :auth_type => :basic
    }

    client = JIRA::Client.new connection_settings
    client
  end

  resource :jira_all do
    action :connect do |params|
      client = init_jira(params)
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

    issue_fields = { "fields" => { "connector call" => "This is RSPEC",
      "project" => { "id" => "10001"},
      "issuetype" => {"id"=>"3"}
      }
    }

    client = init_jira(params)

    create_new_issue = client.Issue.build
    create_new_issue.save(issue_fields)

    end
  end

end

  #
  # resource :client do
  #   action :all do |params|
  #     chef = init_chef(params)
  #     respond safe('Fetching all clients') {|x| chef.clients.all }
  #   end
  #
  #   action :get do |params|
  #     chef = init_chef(params)
  #     id   = params.varify(:id, required:true)
  #     respond safe("Getting client with id '#{id}'"){ chef.clients.fetch(id) }
  #   end
  #
  #   action :create do |params|
  #     chef = init_chef(params)
  #     name = params.varify(:name, is_a:String, required:true)
  #
  #     available_params = %w(admin public_key private_key validator)
  #     client_params = {name:name}.marge(pull_params(params,available_params))
  #
  #     respond safe("Getting client with id '#{id}'"){ chef.clients.create(client_params) }
  #   end
  #
  #   action :delete do |params|
  #     chef = init_chef(params)
  #     id   = params.varify(:id, required:true)
  #     respond safe("Deleting client with id '#{id}'"){ chef.clients.fetch(id).destroy }
  #   end
  # end

  # resource :projects do
  #
  #   # factor call =>> 'jira::projects::list'
  #   action :list do |params|
  #     username = params.varify(:username,required:true,is_a:String)
  #     password = params.varify(:password,required:true,is_a:String)
  #     site     = params.varify(:site, required:true, is_a:String)
  #
  #     info "Connecting to '#{site}' as '#{username}'"
  #     client   = JIRA::Client.new(username:username, password:password, auth_type: :basic, site:site)
  #
  #     respond []
  #   end
  # end
# end



# Show all projectsjira_calls_data
# projects = client.Project.all

# projects.each do |project|
#   puts "Project -> key: #{project.key}, name: #{project.name}, id: #{project.id}"
# end
