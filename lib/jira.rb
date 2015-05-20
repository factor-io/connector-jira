require 'rubygems'
require 'pp' # pretty print
require 'jira'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally
# for tests.

username = ENV['JIRA_USERNAME']
password = ENV['JIRA_PASSWORD']

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
# projects = client.Project.all
# projects_array = []
# projects.each do |project|
  # projects_array << project.key

  # puts "Project -> key: #{project.key}, name: #{project.name}, id: #{project.id}"
  # pp projects_array
# end

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
# pp create_new_issue
pp create_new_issue.self
###############################################################################
# List all issues from one project

# Find a specific project by key
# project = client.Project.find('UP')
# p project
# pp project

# List of all issues
# project.issues.each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
#
# end



###############################################################################
# List All Issues from All projects
# DOES NOT WORK !!! Both methods

# client.Issue.all.each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end

#
# # List issues by JQL query
# # ------------------------
# client.Issue.jql('PROJECT = "UP"', [comments, summary]).each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end
###############################################################################
# Delete an issue DOES NOT WORK
# ---------------
# issue = client.Issue.find('UP-12')

# if issue.delete
#   puts "Delete sucessful"
# else
#   puts "Delete failed"
# end
###############################################################################
# https://github.com/sumoheavy/jira-ruby/issues/69
