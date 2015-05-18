require 'rubygems'
require 'pp'
require 'jira'
require './jira_creditentials.rb'

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

# Show all projects
projects = client.Project.all

projects.each do |project|
  puts "Project -> key: #{project.key}, name: #{project.name}"
end
