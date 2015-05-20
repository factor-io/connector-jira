require 'spec_helper'
require 'pry'

describe JiraConnectorDefinition do
  describe 'test_definition' do
    describe 'test_info' do
      it 'logs info message' do
        @runtime.run([:test_definitions, :test_info])
        expect(@runtime).to message info: "This is info message added to logs"
      end
    end

    describe 'test_warn' do
      it 'logs warn message' do
        @runtime.run([:test_definitions, :test_warn])
        expect(@runtime).to message warn: "This is warn message added to logs"
      end
    end

    describe 'test_error' do
      it 'logs error message' do
        @runtime.run([:test_definitions, :test_error])
        expect(@runtime).to message error: "This is error message added to logs"
      end
    end




  end


  # describe 'projects' do
  #   describe 'list' do
  #     it 'can get a list' do
  #       @runtime.run([:projects,:list], username:@username, password:@password, site:@site)
  #       a = []
  #       expect(@runtime.logs).to eq a
  #       expect(@runtime).to message info:"Registering web hook"
  #     end
  #   end
  # end
  #
  # describe 'issues' do
  #   describe 'add' do
  #     it 'creates new issue on the web' do
  #       @runtime.run([:issues,:add], username:@username, password:@password, site:@site)
  #       expect(@runtime).to respond
  #     end
  #   end
  # end
  #
  # describe 'jira_all' do
  #   describe 'connect' do
  #     it 'creates new issue on the web' do
  #       @runtime.run([:jira_all,:connect], username:@username, password:@password, site:@site)
  #       expect(@runtime).to respond
  #     end
  #   end
  # end







end
