require 'spec_helper'
require 'pry'

describe JiraConnectorDefinition do
  # describe 'test_definition' do
  #   describe 'test_info' do
  #     it 'logs info message' do
  #       @runtime.run([:test_definitions, :test_info])
  #       expect(@runtime).to message info: "This is info message added to logs"
  #     end
  #   end
  #
  #   describe 'test_warn' do
  #     it 'logs warn message' do
  #       @runtime.run([:test_definitions, :test_warn])
  #       expect(@runtime).to message warn: "This is warn message added to logs"
  #     end
  #   end
  #
  #   describe 'test_error' do
  #     it 'logs error message' do
  #       @runtime.run([:test_definitions, :test_error])
  #       expect(@runtime).to message error: "This is error message added to logs"
  #     end
  #   end
  # end
  #
  # describe 'jira_main' do
  #   describe 'initialize' do
  #     it 'creates new issue on the web' do
  #       @runtime.run([:jira_main,:initialize], username:@username, password:@password, site:@site)
  #       expect(@runtime).to message info: "Client created at https://factor.atlassian.net/rest/api/2/ for argoncode18"
  #     end
  #   end
  # end

  describe 'projects' do
    describe 'list' do
      it 'can get a list of projects (keys)' do
        @runtime.run([:projects, :list], username:@username, password:@password, site:@site)
        expect(@runtime).to message info: "You have 2 projects"
      end
    end
  end

  describe 'issues' do
    describe 'add' do
      it 'creates new issue on the web' do
        @runtime.run([:issues,:add], username:@username, password:@password, site:@site,
                                      summary:"This is summary", project_id: 10001, issue_type:"3")
        expect(@runtime).to message info: "Issue number 10171 was created. Summary: This is summary"
        ## TODO: IT IS GOING TO FAIL LATER BECAUSE ID IS GIVEN ON THE FLY. FIND BETTER FIELDS TO TEST
      end
    end
  end



end
