require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Ridwan', email: 'ridwane@gmail.com', password: '123456', password_confirmation: '123456') }

    before { subject.save }

    it "Username should be present" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "Password should be present" do
        subject.password = nil
        expect(subject).to_not be_valid
    end

    it "Email should be present" do
        subject.email = nil
        expect(subject).to_not be_valid
    end

    it "PasswordConfirmation should be present" do
        subject.password_confirmation = '123456'
        expect(subject).to be_valid
    end

    it "Password and PasswordConfirmation should match" do
        subject.password = '123456'
        subject.password_confirmation = '1234567'

        expect(subject).to_not be_valid
    end

    it "Password should be at least 6 characters" do
        subject.password = '12345'

        expect(subject).to_not be_valid
    end

end
