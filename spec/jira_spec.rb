require 'spec_helper'

describe JiraConnectorDefinition do
  describe 'projects' do
    describe 'list' do
      it 'can get a list' do
        @runtime.run([:projects,:list], username:@username, password:@password, site:@site)
        expect(@runtime).to respond
      end
    end
  end
end