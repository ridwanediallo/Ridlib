require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  describe "POST #create" do
    it "creates a new user" do
      post user_registration_path, params: { user: { email: 'ridwanediallo99@gmail.com', password: 'password', password_confirmation: 'password'} }
      expect(response).to redirect_to(root_path)
      expect(User.last.email).to eq('ridwanediallo99@gmail.com')
    end
  end
end
