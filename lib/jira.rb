require 'rubygems'
require 'pp' # pretty print
require 'jira'
require './jira_creditentials.rb'
require './lib/jira_calls_data.rb'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally
# for tests.

username = JIRA_USERNAME # TODO move to proper ENV
password = JIRA_PASSWORD # TODO move to proper ENV

# p username, password

options = {
            :username => username,
            :password => password,
            :site     => 'https://factor.atlassian.net/rest/api/2/',

            :context_path => '',
            :auth_type => :basic
          }

client = JIRA::Client.new(options)

# Show all projectsjira_calls_data
projects = client.Project.all

projects.each do |project|
  puts "Project -> key: #{project.key}, name: #{project.name}, id: #{project.id}"
end

# puts projects

###############################################################################
# create new issue

issue = { "fields" => { "summary" => "This is a summary",
          "project" => { "id" => "10001"},
          "issuetype" => {"id"=>"3"}
                      }
        }

create_new_issue = client.Issue.build
create_new_issue.save(issue)
# pp create_new_issue
# create_new_issue = client.Issue.build
pp create_new_issue.key # return the task key

###############################################################################
