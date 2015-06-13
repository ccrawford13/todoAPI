require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :lists }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :user_name }
  it { should validate_uniqueness_of :user_name }
  it { should validate_presence_of :password }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_presence_of :password_confirmation }

  describe "#full_name" do

    let(:user) { create(:user, first_name: 'jon', last_name: 'smith') }

    it "outputs capitalized full name" do
        expect(user.full_name).to eq 'Jon Smith'
    end
  end

end
