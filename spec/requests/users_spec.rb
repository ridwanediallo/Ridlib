require 'rails_helper'


RSpec.describe 'Users', type: :request do
  describe "Request list of all users" do
    user = User.create(name: 'Ridwan')
    get users_path

    expect(respnse).to be_successful
    expect(response.body).to include(user.name)
  end
end

