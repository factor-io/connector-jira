require 'spec_helper'
require 'pry'

describe JiraConnectorDefinition do
  # describe 'projects' do
  #   describe 'list' do
  #     it 'can get a list' do
  #       # @runtime.start
  #       @runtime.run([:projects,:list], username:@username, password:@password, site:@site)
  #       # binding.pry
  #       expect(@runtime).to respond
  #     end
  #   end
  # end
  #
  describe 'issues' do
    describe 'add' do
      it 'creates new issue on the web' do
        @runtime.run([:issues,:add], username:@username, password:@password, site:@site)
        expect(@runtime).to respond
      end
    end
  end
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
